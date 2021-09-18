//
//  ProfileHeaderViewModel.swift
//  TwitterTutorial
//
//  Created by minmin on 2021/09/18.
//

import UIKit


enum ProfileFilterOptions: Int, CaseIterable {
    
    case tweets
    case replies
    case likes
    
    var description: String{
        switch self {
        case .tweets: return "Tweets"
        case .replies: return "Tweets & Replies"
        case .likes: return "Likes"
        }
    }
}

struct ProfileHeaderViewModel {
    
    private let user:User
    
    var followersString: NSAttributedString? {
        return attributedText(withValue: 0, text: " followers")
    }
    
    var followingString: NSAttributedString? {
        return attributedText(withValue: 2, text: " following")
    }
    
    var actionButtonTitle: String {
        if user.isCurrentuser {
            return "Edit Profile"
        } else {
            return "Follow"
        }
    }
    
    
    init(user: User) {
        self.user = user
    }
    
  fileprivate  func attributedText(withValue value: Int, text: String) -> NSAttributedString {
        let attributedTitle = NSMutableAttributedString(string: "\(value)",
                                                        attributes: [.font: UIFont.boldSystemFont(ofSize: 16)])
        attributedTitle.append(NSAttributedString(string: "\(text)", attributes: [.font: UIFont.systemFont(ofSize: 14),
                                                                                  .foregroundColor: UIColor.lightGray]))
        return attributedTitle
    }
    
}