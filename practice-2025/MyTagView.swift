////
////  MyTagView.swift
////  practice-2025
////
////  Created by Ryota Matsumoto on 4/23/25.
////
//
//import SwiftUI
//import Dispatch
//
////MARK: - Model -
//struct  MyTagModel : Identifiable{
//    var id = UUID()
//    var title: String
//    var imageName: String
//    var caption: String
//    var reviewState : reviewState
//}
//enum reviewState{
//    case inReview
//    case accepted
//    case rejected
//}
//// 2. ViewModel
//class CommunityViewModel: ObservableObject {
//    @Published var items: [MyTagModel] = [
//        MyTagModel(
//            title: "ファッション",
//            imageName: "fashion",
//            caption: "休日はファッションを見ています",
//            reviewState: .inReview
//        ),
//        MyTagModel(
//            title: "スポーツ",
//            imageName: "sports",
//            caption: "運動が好きです",
//            reviewState: .accepted
//        )
//    ]
//}
//
//
//struct CommunityStackView: View {
//    @StateObject private var viewModel = CommunityViewModel()
//    var body: some View {
//        VStack(alignment:.leading){
//            HStack{
//                Text("マイタグ")
//                    .font(.title)
//                    .foregroundColor(.black)
//                Spacer()                
//                Button(action:{(print("全てみる"))}){
//                    Text("全てみる")
//                        .font(.caption)
//                }
//            }            
//            MyTagItemStackView(items: viewModel.items)
//            
//            Spacer(minLength: 24)
//                .fixedSize()
//            
//            HorizontalRollStackView()
//            
//        }
//        .padding()
//    }
//}
//
// 
//struct MyTagItemStackView : View{
//    let items : [MyTagModel]
//    var body : some View{
//        VStack(alignment:.leading){
//            ForEach(items){ item in
//                MyTagItemView(model: item)
//            }
//        }
//    }
//}
//
//struct MyTagItemView: View{
//    var model : MyTagModel
//    var body : some View{
//        HStack{
//            Image(model.imageName)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 88, height: 125)
//                .cornerRadius(12)
//            
////            VStack(alignment:.leading){
////                if reviewState == .inReview{
////                    StatusTagBadgeView(reviewState: reviewState)
////                }
////            }
//            
//                Text(model.title)
//                    .font(.title3)
//                    .foregroundColor(.black)
//                
//                Text(model.caption)
//                    .font(.caption)
//                    .foregroundColor(.gray)
//            }
//        }
//    }
//
//
////MARK: - BadgeView -
////TODO: レビュー状態によってBadgeの出し入れ
//struct StatusTagBadgeView: View{
//    let reviewState: reviewState
//    var body: some View{
//        ZStack {
//            Text("審査中")
//                .fontWeight(.bold)
//                .foregroundColor(.green)
//            
//            Rectangle(width: 100, height: 100)
//                .fill(Color.green)
//                .frame(width: 48   , height: 22)
//                .opacity(0.2)
//        }
//    }
//}
//
//
//
//struct HorizontalRollStackView : View{
//    @StateObject var viewModel = HorizontalRollStackViewModel()
//    
//    var body : some View{
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack(spacing: 10){
//                ForEach(viewModel.items){ item in
//                    HorizontalRollItemView(image: item.image , caption: item.caption)
//                        .padding(.leading, 10)
//                }
//            }
//        }
//    }
//}
//
////MARK: - Model -
//struct HorizontalItemModel : Identifiable {
//    var id = UUID()
//    var image: String
//    var caption : String
//}
//
////MARK: - ViewModel -
//class HorizontalRollStackViewModel : ObservableObject {
//    @Published var items: [HorizontalItemModel] = [
//        HorizontalItemModel(image: "fashion", caption: "ファッションが好き"),
//        HorizontalItemModel(image: "fashion", caption: "ファッションが好き"),
//        HorizontalItemModel(image: "fashion", caption: "ファッションが好き"),
//        HorizontalItemModel(image: "fashion", caption: "ファッションが好き"),
//        HorizontalItemModel(image: "fashion", caption: "りんご"),
//    ]
//}
//
//struct HorizontalRollItemView : View {
//    var image : String
//    var caption : String
//    
//    var body : some View {
//        VStack{
//            Image(image)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 80, height: 80)
//                .background(Color.gray.opacity(0.2))
//            
//            Text(caption)
//                .font(.caption)
//        }
//    }
//}
//
//#Preview ("MyTagStackView"){
//    CommunityStackView()
//}
//#Preview("StatusTagBadge") {
//    VStack {
//        StatusTagBadgeView(reviewState: .inReview)
//        StatusTagBadgeView(reviewState: .accepted)
//        StatusTagBadgeView(reviewState: .rejected)
//    }
//}
//
//#Preview("MyTagItem") {
//    MyTagItemView(
//        model: MyTagModel(
//            title: "ファッション",
//            imageName: "fashion",
//            caption: "休日はファッションを見ています"
//            ,reviewState: .inReview
//        ),
//    )
//}
