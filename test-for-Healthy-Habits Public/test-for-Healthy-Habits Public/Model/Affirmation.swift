//
//  Affirmation.swift
//  test-for-Healthy-Habits Public
//
//  Created by Dmitrii Imaev on 02.08.2024.
//

import Foundation

struct Affirmation {
    let text: String
    let category: String
    let language: String
    let gender: String
    
    init(entity: AffirmationEntity) {
        self.text = entity.text ?? ""
        self.category = entity.category ?? ""
        self.language = entity.language ?? ""
        self.gender = entity.gender ?? ""
    }
    
    init(text: String, category: String, language: String, gender: String) {
        self.text = text
        self.category = category
        self.language = language
        self.gender = gender
    }
}

struct AffirmationData {
    static let affirmations: [Affirmation] = [
        Affirmation(text: "Я достойна любви и заслуживаю получить ее в изобилии", category: "love", language: "ru", gender: "female"),
        Affirmation(text: "Мое сердце открыто для дарения и получения любви", category: "love", language: "ru", gender: "female"),
        Affirmation(text: "Я окружена любовью каждый день и во всех отношениях", category: "love", language: "ru", gender: "female"),
        Affirmation(text: "Я привлекаю любовь и любящие отношения в свою жизнь", category: "love", language: "ru", gender: "female"),
        Affirmation(text: "Любовь течет ко мне и через меня без усилий", category: "love", language: "ru", gender: "female"),
        Affirmation(text: "Я излучаю любовь, и другие отражают любовь обратно ко мне", category: "love", language: "ru", gender: "female"),
        Affirmation(text: "Мои отношения наполнены любовью, счастьем и уважением", category: "love", language: "ru", gender: "female"),
        Affirmation(text: "Я благодарна за любовь, которая меня окружает", category: "love", language: "ru", gender: "female"),
        Affirmation(text: "Любовь приходит ко мне легко и без усилий", category: "love", language: "ru", gender: "female"),
        Affirmation(text: "Я магнит для любящих и удовлетворяющих отношений", category: "love", language: "ru", gender: "female"),
        
        Affirmation(text: "Я достоин любви и заслуживаю получить ее в изобилии", category: "love", language: "ru", gender: "male"),
        Affirmation(text: "Мое сердце открыто для дарения и получения любви", category: "love", language: "ru", gender: "male"),
        Affirmation(text: "Я окружен любовью каждый день и во всех отношениях", category: "love", language: "ru", gender: "male"),
        Affirmation(text: "Я привлекаю любовь и любящие отношения в свою жизнь", category: "love", language: "ru", gender: "male"),
        Affirmation(text: "Любовь течет ко мне и через меня без усилий", category: "love", language: "ru", gender: "male"),
        Affirmation(text: "Я излучаю любовь, и другие отражают любовь обратно ко мне", category: "love", language: "ru", gender: "male"),
        Affirmation(text: "Мои отношения наполнены любовью, счастьем и уважением", category: "love", language: "ru", gender: "male"),
        Affirmation(text: "Я благодарен за любовь, которая меня окружает", category: "love", language: "ru", gender: "male"),
        Affirmation(text: "Любовь приходит ко мне легко и без усилий", category: "love", language: "ru", gender: "male"),
        Affirmation(text: "Я магнит для любящих и удовлетворяющих отношений", category: "love", language: "ru", gender: "male"),
        
        Affirmation(text: "Я окружена поддерживающими и любящими друзьями", category: "friendship", language: "ru", gender: "female"),
        Affirmation(text: "Я привлекаю положительные и верные дружбы в свою жизнь", category: "friendship", language: "ru", gender: "female"),
        Affirmation(text: "Мои друзья и я делимся взаимным уважением и доверием", category: "friendship", language: "ru", gender: "female"),
        Affirmation(text: "Я добрая и заботливая подруга, и я получаю то же самое взамен", category: "friendship", language: "ru", gender: "female"),
        Affirmation(text: "Мои дружбы наполнены радостью, смехом и пониманием", category: "friendship", language: "ru", gender: "female"),
        Affirmation(text: "Я благодарна за удивительных друзей в моей жизни", category: "friendship", language: "ru", gender: "female"),
        Affirmation(text: "Я лелею и берегу свои дружбы", category: "friendship", language: "ru", gender: "female"),
        Affirmation(text: "Я привлекаю друзей, которые поддерживают и поднимают меня", category: "friendship", language: "ru", gender: "female"),
        Affirmation(text: "Мои друзья и я растем вместе в любви и гармонии", category: "friendship", language: "ru", gender: "female"),
        Affirmation(text: "Я магнит для искренних и длительных дружб", category: "friendship", language: "ru", gender: "female"),
        
        Affirmation(text: "Я окружен поддерживающими и любящими друзьями", category: "friendship", language: "ru", gender: "male"),
        Affirmation(text: "Я привлекаю положительные и верные дружбы в свою жизнь", category: "friendship", language: "ru", gender: "male"),
        Affirmation(text: "Мои друзья и я делимся взаимным уважением и доверием", category: "friendship", language: "ru", gender: "male"),
        Affirmation(text: "Я добрый и заботливый друг, и я получаю то же самое взамен", category: "friendship", language: "ru", gender: "male"),
        Affirmation(text: "Мои дружбы наполнены радостью, смехом и пониманием", category: "friendship", language: "ru", gender: "male"),
        Affirmation(text: "Я благодарен за удивительных друзей в моей жизни", category: "friendship", language: "ru", gender: "male"),
        Affirmation(text: "Я лелею и берегу свои дружбы", category: "friendship", language: "ru", gender: "male"),
        Affirmation(text: "Я привлекаю друзей, которые поддерживают и поднимают меня", category: "friendship", language: "ru", gender: "male"),
        Affirmation(text: "Мои друзья и я растем вместе в любви и гармонии", category: "friendship", language: "ru", gender: "male"),
        Affirmation(text: "Я магнит для искренних и длительных дружб", category: "friendship", language: "ru", gender: "male"),
        
        Affirmation(text: "I am worthy of love and deserve to receive love in abundance", category: "love", language: "en", gender: "female"),
        Affirmation(text: "My heart is open to giving and receiving love", category: "love", language: "en", gender: "female"),
        Affirmation(text: "I am surrounded by love every day and in every way", category: "love", language: "en", gender: "female"),
        Affirmation(text: "I attract love and loving relationships into my life", category: "love", language: "en", gender: "female"),
        Affirmation(text: "Love flows to me and through me effortlessly", category: "love", language: "en", gender: "female"),
        Affirmation(text: "I radiate love and others reflect love back to me", category: "love", language: "en", gender: "female"),
        Affirmation(text: "My relationships are filled with love, happiness, and respect", category: "love", language: "en", gender: "female"),
        Affirmation(text: "I am grateful for the love that surrounds me", category: "love", language: "en", gender: "female"),
        Affirmation(text: "Love comes to me easily and effortlessly", category: "love", language: "en", gender: "female"),
        Affirmation(text: "I am a magnet for loving and fulfilling relationships", category: "love", language: "en", gender: "female"),
        
        Affirmation(text: "I am worthy of love and deserve to receive love in abundance", category: "love", language: "en", gender: "male"),
        Affirmation(text: "My heart is open to giving and receiving love", category: "love", language: "en", gender: "male"),
        Affirmation(text: "I am surrounded by love every day and in every way", category: "love", language: "en", gender: "male"),
        Affirmation(text: "I attract love and loving relationships into my life", category: "love", language: "en", gender: "male"),
        Affirmation(text: "Love flows to me and through me effortlessly", category: "love", language: "en", gender: "male"),
        Affirmation(text: "I radiate love and others reflect love back to me", category: "love", language: "en", gender: "male"),
        Affirmation(text: "My relationships are filled with love, happiness, and respect", category: "love", language: "en", gender: "male"),
        Affirmation(text: "I am grateful for the love that surrounds me", category: "love", language: "en", gender: "male"),
        Affirmation(text: "Love comes to me easily and effortlessly", category: "love", language: "en", gender: "male"),
        Affirmation(text: "I am a magnet for loving and fulfilling relationships", category: "love", language: "en", gender: "male"),
        Affirmation(text: "I am surrounded by supportive and loving friends", category: "friendship", language: "en", gender: "female"),
        Affirmation(text: "I attract positive and loyal friendships into my life", category: "friendship", language: "en", gender: "female"),
        Affirmation(text: "My friends and I share mutual respect and trust", category: "friendship", language: "en", gender: "female"),
        Affirmation(text: "I am a kind and caring friend, and I receive the same in return", category: "friendship", language: "en", gender: "female"),
        Affirmation(text: "My friendships are filled with joy, laughter, and understanding", category: "friendship", language: "en", gender: "female"),
        Affirmation(text: "I am grateful for the amazing friends in my life", category: "friendship", language: "en", gender: "female"),
        Affirmation(text: "I nurture and cherish my friendships", category: "friendship", language: "en", gender: "female"),
        Affirmation(text: "I attract friends who support and uplift me", category: "friendship", language: "en", gender: "female"),
        Affirmation(text: "My friends and I grow together in love and harmony", category: "friendship", language: "en", gender: "female"),
        Affirmation(text: "I am a magnet for genuine and lasting friendships", category: "friendship", language: "en", gender: "female"),
        
        Affirmation(text: "I am surrounded by supportive and loving friends", category: "friendship", language: "en", gender: "male"),
        Affirmation(text: "I attract positive and loyal friendships into my life", category: "friendship", language: "en", gender: "male"),
        Affirmation(text: "My friends and I share mutual respect and trust", category: "friendship", language: "en", gender: "male"),
        Affirmation(text: "I am a kind and caring friend, and I receive the same in return", category: "friendship", language: "en", gender: "male"),
        Affirmation(text: "My friendships are filled with joy, laughter, and understanding", category: "friendship", language: "en", gender: "male"),
        Affirmation(text: "I am grateful for the amazing friends in my life", category: "friendship", language: "en", gender: "male"),
        Affirmation(text: "I nurture and cherish my friendships", category: "friendship", language: "en", gender: "male"),
        Affirmation(text: "I attract friends who support and uplift me", category: "friendship", language: "en", gender: "male"),
        Affirmation(text: "My friends and I grow together in love and harmony", category: "friendship", language: "en", gender: "male"),
        Affirmation(text: "I am a magnet for genuine and lasting friendships", category: "friendship", language: "en", gender: "male")
    ]
}
