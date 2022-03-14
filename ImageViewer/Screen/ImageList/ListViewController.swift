//
//  ViewController.swift
//  ImageViewer
//
//  Created by Михаил on 09.03.2022.
//

import UIKit
import DZNEmptyDataSet

class ListImagesViewController: UIViewController {
    
    var networkImageManager = NetworkImageManager()
    var images: [CurrentImageData] = []
    var rootView = ListImagesView(frame: UIScreen.main.bounds)
    lazy var offlineData = LocalStorageImage.shared.getAllImages()
    
    override func loadView() {
        view = rootView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Random photos"
        
        rootView.collectionView.delegate = self
        rootView.collectionView.dataSource = self
        
        rootView.collectionView.emptyDataSetSource = self
        rootView.collectionView.emptyDataSetDelegate = self
        
        loadData()
    }
    
    private func loadData() {
        if !Reachability.isConnectedToNetwork() { return }
        networkImageManager.fetchImages { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.handleFetchImages(result)
            }
        }
    }
    
    private func handleFetchImages(_ result: Result<[CurrentImageData], Error>) {
        switch result {
        case .success(let images):
            self.images = images
            LocalStorageImage.shared.saveImages(images: images)
        case .failure(let error):
            print(error.localizedDescription)
        }
        rootView.collectionView.reloadData()
        rootView.collectionView.reloadEmptyDataSet()
    }
}

extension ListImagesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
        let imageInfo = images[indexPath.row]
        let imageString = imageInfo.urls.small
        cell.imageView.loadImage(imageString)
        cell.labelInfo.text = imageInfo.id
        return cell
    }
}


extension ListImagesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        let image = images[indexPath.row]
        vc.image = image
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionWidth = collectionView.bounds.size.width
        let width = collectionWidth/3
        let imageAspectRatio: CGFloat = 600/400
        let height = width * imageAspectRatio
        return CGSize(width: width, height: height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


extension ListImagesViewController: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    
    func buttonTitle(forEmptyDataSet scrollView: UIScrollView, for state: UIControl.State) -> NSAttributedString? {
        let attributes = [
            NSAttributedString.Key.foregroundColor : UIColor.black,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17.0),
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue
        ] as [NSAttributedString.Key : Any]
        let databaseEmpty = offlineData.isEmpty
        let title = databaseEmpty ? "Обновить" : "Перейти в офлайн"
        return NSAttributedString(string: title , attributes: attributes)
    }
    
    func emptyDataSet(_ scrollView: UIScrollView, didTap button: UIButton) {
        let databaseEmpty = offlineData.isEmpty
        if databaseEmpty {
            loadData()
        } else {
            self.images = offlineData
            self.rootView.collectionView.reloadData()
        }
    }
    
    func title(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        let attributes = [
            NSAttributedString.Key.foregroundColor : UIColor.black,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17.0)
        ]
        var title = "Картинки недоступны, повторите запрос позднее"
        if !Reachability.isConnectedToNetwork() {
            let databaseEmpty = offlineData.isEmpty
            title = databaseEmpty ? "Проверь подключение и повторите загрузку" : "Доступен оффлайн режим"
        }
        return NSAttributedString(string: title, attributes: attributes)
    }
}

