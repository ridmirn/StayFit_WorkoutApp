//
//  ScheduleScreen.swift
//  StayFit_WorkoutApp
//
//  Created by Ridmi on 2023-05-17.
//

import UIKit
import CalendarKit
import EventKit
import EventKitUI

final class ScheduleScreen: DayViewController, EKEventEditViewDelegate {
    
    private let eventStore = EKEventStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Worlout Schedule"
        requestAccessToCalendar()
        subscribeToNotifications()
    }
    
    func requestAccessToCalendar(){
        eventStore.requestAccess(to: .event) { success, error in
            
        }
    }
    
    func subscribeToNotifications(){
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(storeChanged(_:)),
                                               name: .EKEventStoreChanged,
                                               object: nil)
        
    }
    
    @objc func storeChanged(_ notification: Notification){
        reloadData()
    }
    
    override func eventsForDate(_ date: Date) -> [EventDescriptor] {
        let startDate = date
        var oneDayComponents = DateComponents()
        oneDayComponents.day = 1
        
        let endDate = calendar.date(byAdding: oneDayComponents, to: startDate)!
        
        let predicate = eventStore.predicateForEvents(withStart: startDate,
                                                      end: endDate,
                                                      calendars: nil)
        
        let eventKitEvents = eventStore.events(matching: predicate)
        
        let calendarKitEvents = eventKitEvents.map(EventKitWrapper.init)
        
        
        return calendarKitEvents
    }
    
    override func dayViewDidSelectEventView(_ eventView: EventView) {
        guard let ckEvent = eventView.descriptor as? EventKitWrapper else {
            return
        }
        
        let ekEvent = ckEvent.ekEvent
        presentDetailView(ekEvent)
    }
    private func presentDetailView(_ ekEvent: EKEvent){
        let eventViewController = EKEventViewController()
        eventViewController.event = ekEvent
        eventViewController.allowsCalendarPreview = true
        eventViewController.allowsEditing = true
        navigationController?.pushViewController(eventViewController,
                                                 animated: true)
    }
    
    override func dayViewDidLongPressEventView(_ eventView: EventView) {
        endEventEditing()
        guard let ckEvent = eventView.descriptor as? EventKitWrapper else {
            return
        }
        beginEditing(event: ckEvent, animated: true)
    }
    
    override func dayView(dayView: DayView, didUpdate event: EventDescriptor) {
        guard let editingEvent = event as? EventKitWrapper else {return}
        if let originalEvent = event.editedEvent{
            editingEvent.commitEditing()
            
            if originalEvent === editingEvent {
                presentEditingViewForEvent(editingEvent.ekEvent)
                
            }else{
                try! eventStore.save(editingEvent.ekEvent,
                                     span: .thisEvent)
            }
            
           
        }
        reloadData()
    }
    
    func presentEditingViewForEvent(_ ekEvent: EKEvent){
        let editingViewController = EKEventEditViewController()
        editingViewController.editViewDelegate = self
        editingViewController.event = ekEvent
        editingViewController.eventStore = eventStore
        present(editingViewController, animated: true, completion: nil)
    }
    
    override func dayView(dayView: DayView, didLongPressTimelineAt date: Date) {
        endEventEditing()
    }
    
    override func dayViewDidBeginDragging(dayView: DayView) {
        endEventEditing()
    }
    
    override func dayView(dayView: DayView, didLongPressTimelineAt date: Date) {
        let newEventKitEvent = EKEvent(eventStore: eventStore)
        newEventKitEvent.calendar = eventStore.defaultCalendarForNewEvents
        
        var oneHourComponents = DateComponents()
        oneHourComponents.hour = 1
        
        let endDate = calendar.date(byAdding: oneHourComponents, to: date)
        
        newEventKitEvent.startDate = date
        newEventKitEvent.endDate = endDate
        newEventKitEvent.title = "New Event"
        
        let newEventKitWrapper = EventKitWrapper(eventKitEvent: newEventKitEvent)
        newEventKitWrapper.editedEvent = newEventKitWrapper
        
        create(event: newEventKitWrapper, animated: true)
    }
    
    func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
        endEventEditing()
        reloadData()
        controller.dismiss(animated: true, completion: nil)
    }
}
