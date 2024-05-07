//
//  HomePageViewController.swift
//  InvestAppDesign
//
//  Created by Taner Çelik on 2.05.2024.
//

import UIKit

protocol HomePageViewControllerProtocol : AnyObject {
    func configurePortfolioView()
    func setupSeeAllButton()
    func setupInvestNowButton()
}


class HomePageViewController: UIViewController {
    
    
    let planList : [PlanModel] = [
        PlanModel(name: "Gold", subTitle: "30% return", image: #imageLiteral(resourceName: "gold_coin_no_background"), backgroundColor: .goldColor),
    PlanModel(name: "Silver", subTitle: "60% return", image: #imageLiteral(resourceName: "silver_coin_no_background"),  backgroundColor: .silverColor),
    PlanModel(name: "Platinum", subTitle: "90% return", image: #imageLiteral(resourceName: "plat_coin_no_background"),  backgroundColor: .platColor),
    PlanModel(name: "Gold", subTitle: "30% return", image: #imageLiteral(resourceName: "gold_coin_no_background"), backgroundColor: .goldColor),
    PlanModel(name: "Silver", subTitle: "60% return", image: #imageLiteral(resourceName: "silver_coin_no_background"),  backgroundColor: .silverColor),
    PlanModel(name: "Platinum", subTitle: "90% return", image: #imageLiteral(resourceName: "plat_coin_no_background"),  backgroundColor: .platColor)
    ]
    
    let guideList : [InvestmentGuideModel] = [
        InvestmentGuideModel(title: "Basic type of investments", content: "This is how you set your foot for 2020 Stock market recession. What’s next alksndlkasmndklamsdlşasd", image: #imageLiteral(resourceName: "world_image")),
        InvestmentGuideModel(title: "How much can you start with 10000 TL asdasdasd", content: "What do you like to see? It’s a very different market from 2018. The way of the creatueradmasşld", image: #imageLiteral(resourceName: "colorful_image")),
        InvestmentGuideModel(title: "Welcome to New NASDAQ", content: "This is how you set your foot for 2020 Stock market recession. What’s next alksndlkasmndklamsdlşasd", image: #imageLiteral(resourceName: "world_image")),
    ]
    
    @IBOutlet weak var portfolioView: UIView!
    
    @IBOutlet weak var investButton: UIButton!
    
    @IBOutlet weak var plansCollectionView: UICollectionView!
    
    @IBOutlet weak var investmentGuideTableView: UITableView!
    
    @IBOutlet weak var seeAllLabel: UILabel!
    
    @IBOutlet weak var seeAllArrow: UIImageView!
    
    @IBOutlet weak var portfolioLabel: UILabel!
    
    @IBOutlet weak var portfolioBudget: UILabel!
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBAction func investNowButtonClicked(_ sender: Any) {
        print("Invest Now!!!")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        plansCollectionView.dataSource = self
        plansCollectionView.delegate = self
        
        investmentGuideTableView.dataSource = self
        investmentGuideTableView.delegate = self
        
        investmentGuideTableView.showsVerticalScrollIndicator = false
        
        plansCollectionView.showsHorizontalScrollIndicator = false
        
        plansCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        
        investmentGuideTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        
        setupInvestNowButton()

        configurePortfolioView()
        
        setupSeeAllButton()
        
        let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            
            // Hücreler arasındaki boşluğu ayarlayın (opsiyonel)
            layout.minimumInteritemSpacing = 10
            
            // Hücrelerin boyutunu ayarlayın
        layout.itemSize = CGSize(width: plansCollectionView.frame.height * 0.8, height: plansCollectionView.frame.height)
            
            // CollectionView'a layout'ı atayın
        plansCollectionView.collectionViewLayout = layout
        
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "contactInfoVC") as! ContactInfoViewController
        
        vc.delegate = self
        
    }
}


extension HomePageViewController : HomePageViewControllerProtocol {
    
    
    func setupInvestNowButton() {
        investButton.setTitle("Invest now", for: .normal)
        investButton.titleLabel?.font = .systemFont(ofSize: 12, weight: .semibold)
        investButton.setTitleColor( .buttonColor, for: .normal)
        investButton.backgroundColor = .buttonColor
        investButton.layer.cornerRadius = 15
        investButton.clipsToBounds = true
    }
    
    func setupSeeAllButton() {
        
        seeAllLabel.text = "See All"
        
        seeAllLabel.textAlignment = .center
        
        seeAllLabel.font = .systemFont(ofSize: 17, weight: .regular)
        
        seeAllLabel.textColor  = .seeAllColor
        
        
        seeAllArrow.tintColor = .seeAllColor
    }
    
    
    func configurePortfolioView() {
        
        portfolioView.layer.cornerRadius = 20
        
        let gradient = CAGradientLayer()
        
        gradient.colors = [UIColor.red, UIColor.portfolioGradiantRight]
        
        gradient.frame = portfolioView.bounds
        
        gradient.startPoint = CGPoint(x: 0, y: 1)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        
        portfolioView.layer.masksToBounds = true
        
        portfolioView.layer.insertSublayer(gradient, at: 0)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        
        portfolioView.addGestureRecognizer(tapGestureRecognizer)
        
        
    }
    
    @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "myAssetViewController") as UIViewController
        vc.modalPresentationStyle = .pageSheet
        navigationController?.present(vc, animated: true)
        
        
    }
    
    
}

extension HomePageViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        planList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = plansCollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.setup(model: planList[indexPath.row])
        
        return cell
    }

}


extension HomePageViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guideList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = investmentGuideTableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        cell.setup(model: guideList[indexPath.row])
        
        return cell
        
        
    }
}


extension HomePageViewController : ChangeNameDelegate {
    func didChangeName(name: String) {
        welcomeLabel.text = "Welcome, \(name)"
    }
    
    
}
