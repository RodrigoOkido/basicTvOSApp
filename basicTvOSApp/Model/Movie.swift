//
//  Movie.swift
//  basicTvOSApp
//
//  Created by Rodrigo Yukio Okido on 31/03/22.
//

struct Movie {
    let name: String
    let overview: String
}


extension Movie {
    static var movies: [Movie] {
        [
            Movie(name: "Turning Red",
                  overview: "Thirteen-year-old Mei is experiencing the awkwardness of being a teenager with a twist – when she gets too excited, she transforms into a giant red panda."),
            
            Movie(name: "The Ice Age Adventures of Buck Wild",
                  overview: "The fearless one-eyed weasel Buck teams up with mischievous possum brothers Crash & Eddie as they head off on a new adventure into Buck's home: The Dinosaur World."),
            
            Movie(name: "The King's Man",
                  overview: "As a collection of history's worst tyrants and criminal masterminds gather to plot a war to wipe out millions, one man must race against time to stop them."),
            
            Movie(name: "Encanto",
                  overview: "The tale of an extraordinary family, the Madrigals, who live hidden in the mountains of Colombia, in a magical house, in a vibrant town, in a wondrous, charmed place called an Encanto. The magic of the Encanto has blessed every child in the family with a unique gift from super strength to the power to heal—every child except one, Mirabel. But when she discovers that the magic surrounding the Encanto is in danger, Mirabel decides that she, the only ordinary Madrigal, might just be her exceptional family's last hope."),
            
            Movie(name: "Scream",
                  overview: "Twenty-five years after a streak of brutal murders shocked the quiet town of Woodsboro, a new killer has donned the Ghostface mask and begins targeting a group of teenagers to resurrect secrets from the town’s deadly past."),
            
            Movie(name: "Eternals",
                  overview: "The Eternals are a team of ancient aliens who have been living on Earth in secret for thousands of years. When an unexpected tragedy forces them out of the shadows, they are forced to reunite against mankind’s most ancient enemy, the Deviants.")
        ]
    }
}

