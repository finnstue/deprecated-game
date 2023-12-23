# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

type1_questions_content = [
  "Welches Bild ist verrückter?",
  "Welches Bild passt besser zu Line?",
  "Welches Bild passt besser zu Hans Jörg?",
  "Welches Bild passt besser zu Ingi?",
  "Welches Bild ist mehr Kunst?",
  "Welches kann weg?",
  "Welches Bild sollte man rahmen lassen und in Utne aufhängen?",
  "Welches Bild ist leckerer?",
  "Welches Bild würde ein Alien verwirren?",
  "Welches Bild könnte eine Zeitmaschine darstellen?",
  "Welches Bild könnte ein Geheimnis verbergen?",
  "Welches Bild sieht aus, als könnte es ein neues Musikgenre repräsentieren?",
  "Welches Bild könnte einen Roboter zum Lachen bringen?",
  "Welches Bild würde in einer Zauberwelt existieren?",
  "Welches Bild sieht aus, als hätte es ein Superheld gemalt?",
  "Welches Bild sieht aus wie der perfekte Ort für einen Schatz?",
  "Welches Bild sieht aus wie der perfekte Ort für ein Picknick?",
  "Welches Bild könnte ein neues Wunder der Welt sein und warum?",
  "Welches Bild sieht aus, als könnte es eine neue Sportart inspirieren?",
  "Wenn du in einem Sandwich wohnen könntest, welches Bild wäre deine Mayonnaise?",
  "Wenn Bild eignet sich besser als Cover von dem Buch So wirst Du einfach schlank: 100 geheime effektive wissenschaftliche Minimal - Strategien von Hans Jörg Sternborg?",
  "Welches Bild würde als Wappen für deine fiktive Dynastie dienen?",
  "Wo würdest du lieber Urlaub machen wollen?",
  "Wenn du eine eigene Insel hättest, welches Bild wäre deine Flagge?",
  "Welches Bild sollte man aus einen Pullover stricken?",
  "Welches Bild eignet sich besser für ein intergalaktische Ruderregatta?",
  "Welche Bild ist ein zukünftiges Cesena?",
  "Wo kann man besser baden?",
  "Wo kann man besser als Familie wandern gehen?"
]

type2_questions_content = [
  "Erstelle eine Zeitungsüberschrift für dieses Bild",
  "Was passiert in diesem bizarren Foto",
  "Welches versteckte Rätsel verbirgt das Bild?",
  "Schreibe einen Werbeslogan für ein Produkt, das mit diesem Foto beworben wird",
  "Was ist die Hintergrundgeschichte dieses verwirrenden Fotos",
  "Erfinde einen humorvollen Werbeslogan für diese Erfindung",
  "Schreibe den Filmtitel für einen Film, der dieses Bild als Filmplakat hat",
  "Gib diesem seltsamen Renaissance-Gemälde einen modernen Titel",
  "Wer hat dieses Foto gemacht?",
  "Welches wissenschaftliche Experiment führen Wissenschaftler hier durch?",
  "Welcher Zukunftssport wird erfunden, der so aussieht?",
  "Welcher berühmte Maler hat dieses Bild gemalt?",
  "Du steigst in eine Zeitmaschine und kommst hier raus. Wo bist du?",
  "Wie würde eine neue Sportart heißen, die durch dieses Bild gezeigt wird?"
]

type1_questions_content.each do |content|
  Question.create!(content: content, question_type: 'type1')
end

type2_questions_content.each do |content|
  Question.create!(content: content, question_type: 'type2')
end

# Create a sample game
Game.create(code: SecureRandom.hex(4), status: "lobby")
