//
//  UserProfileView.swift
//  TBDMPlatformTestTask
//
//  Created by Борис Кравченко on 18.09.2023.
//

//MARK: заглушка для экрана "Профиль пользователя"

import SwiftUI

struct UserProfileView: View {
    @State private var userImage: Image?
    @State private var username: String = ""
    @State private var bio: String = "Здесь могла бы быть ваша биография."
    
    var body: some View {
        VStack {
            // Фотография профиля пользователя (если есть)
            if let userImage = userImage {
                userImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .padding(.bottom, 20)
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .foregroundColor(.gray)
                    .padding(.bottom, 20)
            }
            
            Text(username)
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            
            Text(bio)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("Профиль пользователя", displayMode: .inline)
        .onAppear {
            
            username = getRandomUsername()
        }
    }
    
    // Функция для генерации случайного имени пользователя (пример)
    func getRandomUsername() -> String {
        let usernames = ["Иван Иванов", "Елена Петрова", "Андрей Смирнов", "Ольга Кузнецова", "Дмитрий Васильев", "Татьяна Федорова", "Александр Морозов", "Светлана Волкова", "Максим Денисов", "Мария Алексеева", "Павел Зайцев", "Анна Павлова", "Сергей Соколов", "Юлия Козлова", "Никита Лебедев", "Ирина Новикова", "Антон Егоров", "Екатерина Петрова", "Владимир Михайлов", "Евгения Семенова", "Георгий Козлов", "Наталья Горбунова", "Артем Фомин", "Валентина Королева", "Виктор Захаров", "Лариса Шевцова", "Игорь Гусев", "Елена Макарова", "Алексей Лебедев", "Оксана Куликова"]
        return usernames.randomElement() ?? "Unknown User"
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
