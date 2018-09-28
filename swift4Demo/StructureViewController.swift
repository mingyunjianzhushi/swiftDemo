//
//  StructureViewController.swift
//  swift4Demo
//
//  Created by 命运 on 2018/8/17.
//  Copyright © 2018年 com.org.shunshiwei. All rights reserved.
//

import UIKit

class StructureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		let f = Fahrcnheit()
		print("The default temperature is \(f.temperature) Fahrcnheit")
		//
		self.title = "构造器包含转换类型";
		
		let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
		print(boilingPointOfWater)
		// boilingPointOfWater.temperatureInCelsius 是 100.0
		let freezingPointOfWater = Celsius(222)
		print(freezingPointOfWater)
		// freezingPointOfWater.temperatureInCelsius 是 0.0

//		两种构造器都能用于创建一个新的 Color 实例，你需要为构造器每个外部参数传值:
		let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
		let halfGray = Color(white: 0.5)
		
		
		let cheeseQuestion = SurveryQuestion(text: "Do you like cheese?")
		cheeseQuestion.ask()
		// 打印 "Do you like cheese?"
		cheeseQuestion.response = "Yes, I do like cheese."
	
		if cheeseQuestion.response != nil {
			print(cheeseQuestion.response!);
		}
//		foodDemo()
		animalDemo()
		
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	struct Fahrcnheit {
		var temperature: Double
		var temperature2 = 32.0
		init() {
			temperature = 32.0
		}
	}
	
	struct Celsius {
		var temoeratureInClesius:Double
		init(fromFahrenheit  fahrenheit:Double){
			temoeratureInClesius = (fahrenheit - 32.0) / 1.8
		}
		
		//因此适合使用 init(_ celsius: Double) 这样的构造器，从 而可以通过提供 Double 类型的参数值调用构造器，而不需要加上外部名
		init(_ kelvin: Double) {
			temoeratureInClesius = kelvin - 273.15
		}
		
	}
	
	struct Color {
		let red, green, blue: Double
		init(red: Double, green: Double, blue: Double) {
			self.red   = red
			self.green = green
			self.blue  = blue
		}
		init(white: Double) {
			red   = white
			green = white
			blue  = white
		}
		
	}
	
}

//如果你定制的类型包含一个逻辑上允许取值为空的存储型属性——无论是因为它无法在初始化时赋值，还是因为 它在之后某个时间点可以赋值为空——你都需要将它定义为 可选类型 。可选类型的属性将自动初始化为 nil ，表 示这个属性是有意在初始化时设置为空的

//构造过程中常量属性的修改
class SurveryQuestion {
	let text : String  //如果没有构造器的赋值，会报错
	var response : String?
	init(text:String) {
		self.text = text
	}
	
	func ask(){
		print(text)
	}
}

func foodDemo(){
	let nameMeat = Food(name: "tang")
	print(nameMeat.name)
	
	let nameUn = Food()
	print(nameUn.name)
	
	let oneMySteryItem = RecipeIngredient()
	let oneBacon = RecipeIngredient(name: "唐")
	let sixEggs = RecipeIngredient(name: "eggs", quantity: 7)
	
	
	var breakfastList = [
		shoppingListItem(),
		shoppingListItem(name: "Bacon"),
		shoppingListItem(name: "Eggs", quantity: 6),
		]
	breakfastList[0].name = "Orange juice"
	breakfastList[0].purchased = true
	for item in breakfastList {
		print(item.description)
	}
	// 1 x orange juice ?
	// 1 x bacon ?
	// 6 x eggs ?
}

//convenience  声明一个便利构造器
//Food 类中的构造器 init(name: String) 被定义为一个指定构造器，因为它能确保 Food 实例的所有存储型属性都 被初始化。 Food 类没有父类，所以 init(name: String) 构造器不需要调用 super.init() 来完成构造过程
class Food {
	var name:String
	init(name:String) {
		self.name = name
	}
	
	convenience init(){
		self.init(name: "[Unnamed]")
	}
}

class RecipeIngredient: Food {
	var quantity : Int
	init(name: String , quantity:Int) {
		self.quantity = quantity
		super.init(name: name)
	}
	
	convenience override init(name: String) {
		self.init(name: name, quantity: 1)
	}
}

class shoppingListItem : RecipeIngredient {
	var purchased = false
	var description : String{
		var output = "\(quantity) x \(name)"
		output += purchased ? " ?" : " ?"
		return output
	}
}


/// 可失败构造器
func animalDemo(){
	//通过可失败构造器来构建一个animal实例
	let someCreature = Animal(species: "Giraffe")
	
	if let giraffe = someCreature {
		print("An animal was initialized with a species of \(giraffe.species)")
	}
	// 打印 "An animal was initialized with a species of Giraffe"
	
	
	
	let anonymousCreature = Animal(species: "")
	// anonymousCreature 的类型是 Animal?, 而不是 Animal
	if anonymousCreature == nil {
		print("The anonymous creature could not be initialized")
	}
	// 打印 "The anonymous creature could not be initialized"
	
	
	let fahrenheitUnit = TemperatureUnit(symbol: "F")
	if fahrenheitUnit != nil {
		print("This is a defined temperature unit, so initialization succeeded.")
	}
	// 打印 "This is a defined temperature unit, so initialization succeeded."
	let unknownUnit = TemperatureUnit(symbol: "X")
	if unknownUnit == nil {
		print("This is not a defined temperature unit, so initialization failed.")
	}
	// 打印 "This is not a defined temperature unit, so initialization failed."
}

struct Animal {
	let species : String
	init?(species:String){
		if species.isEmpty{
			return nil
		}
		self.species = species
	}
}

enum TemperatureUnit {
	case Kelvin, Celsius, Fahrenheit
	init?(symbol: Character) {
		switch symbol {
		case "K":
			self = .Kelvin
		case "C":
			self = .Celsius
		case "F":
			self = .Fahrenheit
		default:
			return nil
			
		}
	} }


///必要构造器
//在类的构造器前添加 required 修饰符表明所有该类的子类都必须实现该构造器
class OneClass {
	required init() {
		// 构造器的实现代码
	}
	
}

//MARK:required 修饰符
//在子类重写父类的必要构造器时，必须在子类的构造器前也添加 required 修饰符，表明该构造器要求也应用于继 承链后面的子类。在重写父类中必要的指定构造器时，不需要添加 override 修饰符
class oneSubClass: OneClass {
	required init() {
		// 构造器的实现代码
	}
}


//MARK:=============类型转换===============
func MediaItemDemo(){
	let library = [
		Movie(name: "Casablanca", director: "Michael Curtiz"),
		Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
		Movie(name: "Citizen Kane", director: "Orson Welles"),
		Song(name: "The One And Only", artist: "Chesney Hawkes"),
		Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
	]
	
	var movieCount = 0
	var songCount = 0
	
	for item in library{
		//判断类型
		if item is Movie{
			movieCount += 1
		}else if item is Song{
			songCount += 1
		}
	}
	
	print("Media library contains \(movieCount) movies and \(songCount) songs") // 打印 “Media library contains 2 movies and 3 songs”
	
	//判断方法二
	/*
	某类型的一个常量或变量可能在幕后实际上属于一个子类。当确定是这种情况时，你可以尝试向下转到它的子类
	型，用类型转换操作符(as? 或 as!)。 因为向下转型可能会失败，类型转型操作符带有两种不同形式。条件形式as? 返回一个你试图向下转成的类型的
	可选值。强制形式 as! 把试图向下转型和强制解包(转换结果结合为一个操作。 当你不确定向下转型可以成功时，用类型转换的条件形式( as? )。条件形式的类型转换总是返回一个可选
	值，并且若下转是不可能的，可选值将是 nil 。这使你能够检查向下转型是否成功
	*/
	
	for item in library{
		//试图转换为Movie，转换失败则为nil
		if let movie  = item as? Movie{
			print("Movie: '\(movie.name)', dir. \(movie.director)")
		} else if let song = item as? Song {
			print("Song: '\(song.name)', by \(song.artist)")
		}

	}
	
	/*
	示例首先试图将 item 下转为 Movie 。因为 item 是一个 MediaItem 类型的实例，它可能是一个 Movi
	e ;同样，它也可能是一个 Song ，或者仅仅是基类 MediaItem 。因为不确定， as? 形式在试图下转时将返回 一个可选值。 item as? Movie 的返回值是 Movie? 或者说“可选 Movie ”
	*/
}



class MediaItem {
	var name: String
	init(name: String) {
		self.name = name
	}
	
}


class Movie: MediaItem {
	var director: String
	init(name: String, director: String) {
		self.director = director
		super.init(name: name)
	}
}
class Song: MediaItem {
	var artist: String
	init(name: String, artist: String) {
		self.artist = artist
		super.init(name: name)
	}
}

//MARK:=============Any和AnyObject的类型转换

/*
Swift 为不确定类型提供了两种特殊的类型别名:
• Any 可以表示任何类型，包括函数类型。
• AnyObject 可以表示任何类类型的实例
*/

///Any和AnyObject的类型转换
func demo1(){
	var things = [Any]()
	things.append(0)
	things.append(0.0)
	things.append(42)
	things.append(3.14159)
	things.append("hello")
	things.append((3.0, 5.0))
	things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
	things.append({ (name: String) -> String in "Hello, \(name)" })
	
	
	for thing in things {
		switch thing {
		case 0 as Int:
			print("zero as an Int")
		case 0 as Double:
			print("zero as a Double")
		case let someInt as Int:
			print("an integer value of \(someInt)")
		case let someDouble as Double where someDouble > 0:
			print("a positive double value of \(someDouble)")
		case is Double:
			print("some other double value that I don't want to print")
		case let someString as String:
			print("a string value of \"\(someString)\"")
		case let (x, y) as (Double, Double):
			print("an (x, y) point at \(x), \(y)")
		case let movie as Movie:
			print("a movie called '\(movie.name)', dir. \(movie.director)")
		case let stringConverter as (String) -> String:
			print(stringConverter("Michael"))
		default:
			print("something else")
		}
		
		let optionNumber : Int? = 3
		things.append(optionNumber as Any) //需要转换为Any不让警告
		
	}
	// zero as an Int
	// zero as a Double
	// an integer value of 42
	// a positive double value of 3.14159
	// a string value of "hello"
	// an (x, y) point at 3.0, 5.0
	// a movie called 'Ghostbusters', dir. Ivan Reitman
	// Hello, Michael
}





