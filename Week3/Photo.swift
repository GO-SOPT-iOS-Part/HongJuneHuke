//
//  Photo.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/22.
//

import UIKit

struct Photo {
    let image: UIImage
    var heartTapped: Bool
}

extension Photo {
    static func dummy() -> [Photo] {
        var photos: [Photo] = []
        for number in 1...12 {
            photos.append(Photo(image: ImageLiteral.tvingIcon,
                                heartTapped: false))
        }
        return photos + photos
    }
}

//extension Photo {
//
//    static func dummy() -> [Photo] {
//
//        return [Photo(image: ImageLiteral.tvingIcon, heartTapped: false),
//                Photo(image: ImageLiteral.tvingIcon, heartTapped: false),
//                Photo(image: ImageLiteral.tvingIcon, heartTapped: false),
//                Photo(image: ImageLiteral.tvingIcon, heartTapped: false),
//                Photo(image: ImageLiteral.tvingIcon, heartTapped: false),
//                Photo(image: ImageLiteral.tvingIcon, heartTapped: false),
//                Photo(image: ImageLiteral.tvingIcon, heartTapped: false),
//                Photo(image: ImageLiteral.tvingIcon, heartTapped: false),
//                Photo(image: ImageLiteral.tvingIcon, heartTapped: false),
//                Photo(image: ImageLiteral.tvingIcon, heartTapped: false),
//                Photo(image: ImageLiteral.tvingIcon, heartTapped: false),
//                Photo(image: ImageLiteral.tvingIcon, heartTapped: false),
//                Photo(image: ImageLiteral.tvingIcon, heartTapped: false),
//                Photo(image: ImageLiteral.tvingIcon, heartTapped: false),
//                Photo(image: ImageLiteral.tvingIcon, heartTapped: false),
//                Photo(image: ImageLiteral.tvingIcon, heartTapped: false),
//                Photo(image: ImageLiteral.tvingIcon, heartTapped: false),
//                Photo(image: ImageLiteral.tvingIcon, heartTapped: false),
//                Photo(image: ImageLiteral.tvingIcon, heartTapped: false),
//                Photo(image: ImageLiteral.tvingIcon, heartTapped: false),
//                Photo(image: ImageLiteral.tvingIcon, heartTapped: false),
//                Photo(image: .photo_10, heartTapped: false),
//                Photo(image: .photo_11, heartTapped: false),
//                Photo(image: .photo_12, heartTapped: false),
//                Photo(image: .photo_1, heartTapped: false),
//        ]
//    }
//}
