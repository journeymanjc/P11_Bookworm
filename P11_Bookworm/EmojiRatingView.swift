//
//  EmojiRatingView.swift
//  P11_Bookworm
//
//  Created by Jae Cho on 6/2/22.
//

import SwiftUI

struct EmojiRatingView: View {
	let rating: Int16
	
    var body: some View {
		 switch rating {
		 case 1:
			 Text("😭")
		 case 1:
			 Text("😞")
		 case 1:
			 Text("🤨")
		 case 1:
			 Text("😋")
		 default :
			 Text("😆")
		 }
    }
}

struct EmojiRatingView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiRatingView(rating: 3)
    }
}
