//
//  EditProfil.swift
//  EDU_TEAM2
//
//  Created by Winner Tjandrawan on 26/10/21.
//

import SwiftUI


struct TextFieldClearButton: ViewModifier {
    
    @Binding var text: String
    
    func body(content: Content) -> some View {
        HStack {
            content
            
            if !text.isEmpty {
                Button(
                    action: { self.text = "" },
                    label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color(UIColor.opaqueSeparator))
                    }
                )
            }
        }
    }
}


struct EditProfil: View {
    let defaults = UserDefaults.standard
    @Environment(\.presentationMode) var presentationMode
    @State private var showingAlert = false
    
    @Binding var nama: String
    @Binding var email: String
    
    @State private var isShowPhotoLibrary = false
    @Binding var image: UIImage
    
    @State var editNama = ""
    @State var editEmail = ""
    
    var body: some View {
        VStack(alignment: .center,spacing:0){
            ZStack{
                Button(action: {
                    self.isShowPhotoLibrary = true
                }, label: {
                    Image(uiImage: self.image)
                        .resizable()
                }).accentColor(.black)
                VStack{
                    Spacer()
                    HStack{
                        Text("Edit")
                            .padding(.horizontal, 30)
                            .background(Color.black)
                            .foregroundColor(.white)
                    }
                }
            }
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.black, lineWidth: 1))
            
            Rectangle().frame(height: 1).foregroundColor(.black).opacity(0.1).padding(.top)
            
            HStack{
                Text("Nama")
                Spacer(minLength: 20)
                TextField("Masukkan nama anda", text: $editNama)
                    .modifier(TextFieldClearButton(text: $editNama))
                
            }
            .padding(.vertical)
            
            Rectangle().frame(height: 1).foregroundColor(.black).opacity(0.1)
            
            HStack(alignment: .center) {
                Text("Email")
                Spacer(minLength: 20)
                TextField("Masukkan email anda", text: $editEmail)
                    .modifier(TextFieldClearButton(text: $editEmail))
            }.padding(.vertical)
            
            Rectangle().frame(height: 1).foregroundColor(.black).opacity(0.1)
            Spacer()
        }
        .navigationBarTitle(Text("Informasi Pribadi"), displayMode: .inline)
        .navigationBarItems(trailing:
                                Button(action: {
                                    nama = editNama
                                    email = editEmail
                                    defaults.set(nama, forKey: "Nama")
                                    defaults.set(email, forKey: "Email")
                                    let data = image.jpegData(compressionQuality: 0.5)
                                    let encoded = try! PropertyListEncoder().encode(data)
                                    defaults.set(encoded, forKey: "Foto")
            
                                    DispatchQueue.main.async {
                                        self.presentationMode.wrappedValue.dismiss()
                                    }
                                    
                                }, label: {
                                    Text("Simpan")
                                })
        )
        .padding()
        .sheet(isPresented: $isShowPhotoLibrary) {
            ImagePicker(sourceType: .photoLibrary,selectedImage: self.$image)
        }
        .onAppear(perform: {
            editNama = nama
            editEmail = email
            if let data = UserDefaults.standard.data(forKey: "Foto"){
                let decoded = try! PropertyListDecoder().decode(Data.self, from: data)
                self.image = UIImage(data: decoded)!
            }
            else{
                self.image = UIImage(systemName: "person.fill")!
            }
        })
    }
}

struct EditProfil_Previews: PreviewProvider {
    static var previews: some View {
        EditProfil(nama: .constant(nama ?? ""), email: .constant(email ?? ""), image: .constant(UIImage(data: image!)!))
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    
    var sourceType: UIImagePickerController.SourceType
    @Binding var selectedImage: UIImage
    @Environment(\.presentationMode) private var presentationMode
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            print(parent.selectedImage)
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

