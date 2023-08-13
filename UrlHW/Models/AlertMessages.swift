//
//  AlertMessages.swift
//  UrlHW
//
//  Created by Акира on 13.08.2023.
//

struct AlertMessages {
    
    static var shared = AlertMessages()
    
    let title = "Аватарки"
    let message = "Я тут решил сделать хоть что-то полезное и интересное, должно быть прикольно. Здесь ты можешь получить арт либо с мальчиком, либо с девочкой. Выбери нужный вариант и если арт понравится - просто тапни по нему и скопируешь ссылку к себе в буфер обмена. Дерзай "
    
    let tileForCopy = "Готово!"
    let messageForCopy = "Изображение скопировано в буфер обмена!"
    
    private init() {}
}
