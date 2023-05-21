//
//  HomeViewController.swift
//  StayFit_WorkoutApp
//
//  Created by Ridmi Natasha on 2023-05-21.
//


import UIKit
import Firebase

enum Section: Int {
   
    case weightgain = 0
    case weightloss = 1
    
}

class HomeViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    private var randomWorkouts: Workout?
    private var headerView: WeightgainHeaderView?
    
    
    let sectionWorkouts: [String] = ["weightgain", "weightloss"]
    
    private let homeView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        view.addSubview(homeView)
        
        homeView.delegate = self
        homeView.dataSource = self
        
            // configureNavbar()
        
        headerView = WeightgainHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 400))
        homeView.tableHeaderView = headerView
        configureWorkoutHeaderView()
    }
    
    private func configureWorkoutHeaderView(){
        APICaller.shared.getweightgain { [weak self] result in
            switch result {
            case .success(let Workouts):
                let selectedTitle = Workouts.randomElement()
                self?.randomWorkouts = selectedTitle
                self?.headerView?.configure(with: TitleViewModel(workoutName: selectedTitle?.WorkoutName ?? "", posterURL: selectedTitle?.url ?? ""))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeView.frame = view.bounds
    }
    
    
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionWorkouts.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as? CollectionTableViewCell else{
            return UITableViewCell()
        }
        
        cell.delegate = self
        
        switch indexPath.section {
        case Section.weightgain.rawValue:
            
            APICaller.shared.getweightgain{ result in
                switch result {
                case .success(let Workouts):
                    cell.configure(with: Workouts)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        case Section.weightloss.rawValue:

            APICaller.shared.getweightloss{ result in
                switch result {
                case .success(let Workouts):
                    cell.configure(with: Workouts)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }


        default:
            return UITableViewCell()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .black
        header.textLabel?.text = header.textLabel?.text?.capitalized
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionWorkouts[section]
    }
    
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
    
    
}

extension HomeViewController: CollectionTableViewCellDelegate {
    func CollectionTableViewCellDidTapCell(_ cell: CollectionTableViewCell, viewModel: cipePreviewViewModel) {
        DispatchQueue.main.async { [weak self] in
                        let vc = cipePreviewViewController()
            
                        vc.configure(with: viewModel)
                        self?.navigationController?.pushViewController(vc, animated: true)
                    }
            
        }
    }

