//
//  Controller.swift
//  TemplatesiOS
//
//  Created by Nikita Arkhipov on 24/03/2018.
//  Copyright © 2018 Anvics. All rights reserved.
//

import UIKit
import Bond
import Amber

let FriendsListModule = FriendsListController.self

final class FriendsListController: UIViewController, AmberController {

    let store = AmberStore(reducer: FriendsListReducer(), router: FriendsListRouter())

    static let storyboardFile = "FriendsList"
    static let storyboardID = "FriendsListController"

    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        bind()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        perform(action: .loadUserList(GetFriendsInteractor()))
    }
    
    //MARK: - IBActions

}

//MARK: - Bindings
extension FriendsListController{
    func bind(){
        state.map { $0.allItems }.bind(to: tableView) { items, index, tableView in
            let cell = tableView.dequeueReusableCell(withIdentifier: "ContentCell", for: index) as! FriendsListCell
            let item = items[index.row]
            cell.nameLabel.text = "\(item.first_name) \(item.last_name)"
            DispatchQueue.main.async {
                cell.avatarView.loadAndCachedImage(url: item.photo_50)
            }
            return cell
        }
    }
}

//MARK: - UI
extension FriendsListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        perform(transitions: .showFriendPhotos(currentState.allItems[indexPath.row].id))
    }
}

//MARK: - Helpers
extension FriendsListController{

}

