import SwiftUI


struct CustomTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("KohinoorDevanagari-Medium", fixedSize: 20))
            .bold()
            .padding(.leading, 16)
            .padding(.bottom, 8)
    }
}


