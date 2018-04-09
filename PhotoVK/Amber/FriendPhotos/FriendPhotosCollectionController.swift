//
//  CollectionCollectionController.swift
//  Tetrapak
//
//  Created by mapmelad on 03/04/2018.
//  Copyright © 2018 Anvics. All rights reserved.
//

import UIKit
import Bond
import Amber
//import Animatics
//import AnimaticsBond

let FriendPhotosCollectionModule = FriendPhotosCollectionController.self

final class FriendPhotosCollectionController: UIViewController, AmberController {

    let store = AmberStore(reducer: FriendPhotosCollectionReducer(), router: FriendPhotosCollectionRouter())

    static let storyboardFile = "FriendPhotosCollection"
    static let storyboardID = "FriendPhotosCollectionController"
    fileprivate let reuseIdentifier = "Cell"
    
    //MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        perform(action: .countPhoto(CountPhotoInteractor(id: currentState.userId)))
    }

    //MARK: - IBActions

}

//MARK: - Bindings
extension FriendPhotosCollectionController{
    func bind(){
        state.map { $0.photos }.bind(to: collectionView) { items, index, collectionView in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: index) as! FriendPhotosCollectionViewCell
            let item = items[index.row]
            DispatchQueue.main.async {
                cell.photosImageView.loadAndCachedImage(url: item.photo_130)
            }
            return cell
        }
    }
}

//MARK: - UI
extension FriendPhotosCollectionController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var heightCell = UIScreen.main.bounds.width / 3
        return CGSize(width: heightCell, height: heightCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        perform(action: .sendUrlToRoute(indexPath.row))
    }
}
