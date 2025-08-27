//
//  OwnerDTOMapping.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import Foundation

extension OwnerDTO {
    func mapping() -> Owner {
        return Owner(
            id: id,
            avatarURL: avatarURL
        )
    }
}
