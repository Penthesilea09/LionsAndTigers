//
//  ViewController.swift
//  03 Lions And Tigers
//
//  Created by Victor Martinez on 29/09/14.
//  Copyright (c) 2014 Victor Mart. All rights reserved.
//
//Basic program to learn structs, instances, vars, lets and basic swift languaje.
//Thanks to Eliot Arntz and everyone who helps him from bitfountain.io for doing this easy to learn :)

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    
    @IBOutlet weak var videoWebView: UIWebView!
    
    var tigersArray:[Tiger] = []
    var previousNumber:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //creamos instancias de la estructura Tiger
        //Create instances of Tiger Struct
        var myTiger = Tiger()
        myTiger.name = "Tigger"
        myTiger.breed = "Tigre Bengali"
        myTiger.age = 3
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        myTiger.chuff()
        
        var secondTiger = Tiger()
        secondTiger.name = "Tigresa"
        secondTiger.breed = "Tigre Indochino"
        secondTiger.age = 2
        secondTiger.image = UIImage(named: "IndochineseTiger.jpg")
        
        var thirdTiger = Tiger()
        thirdTiger.name = "Jacobo"
        thirdTiger.breed = "Tigre Malayo"
        thirdTiger.age = 4
        thirdTiger.image = UIImage(named: "MalayanTiger.jpg")
        
        var fourthTiger = Tiger()
        fourthTiger.name = "Rayas"
        fourthTiger.breed = "Tigre Siberiano"
        fourthTiger.age = 5
        fourthTiger.image = UIImage(named: "SiberianTiger.jpg")
        
        //añadimos los tigres al array
        //adding tigers to the array
        self.tigersArray = [myTiger, secondTiger, thirdTiger, fourthTiger]
        
        //hacemos que el primer tigre sea aleatorio creando un numero aleatorio y asignandolo al indice del array de Tigres
        //First Tiger random by creating a random number and assign it to de Tiger Array´s index
        var numeroAleatorio = Int(arc4random_uniform(UInt32(tigersArray.count)))
        
        self.myImageView.image = tigersArray[numeroAleatorio].image
        self.nameLabel.text = tigersArray[numeroAleatorio].name
        self.ageLabel.text = ("\(tigersArray[numeroAleatorio].age)")
        self.breedLabel.text = tigersArray[numeroAleatorio].breed
        
        //asignamos el numero aleatorio al numero anterior para inicializar el previousNumber y que al apretar el boton siguiente no sea el mismo
        //assign the random number to the previous number to initialize previousNumber and when nextButton is pressed previous number won't be the same
        self.previousNumber = numeroAleatorio
        
        self.videoWebView.hidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: IBActions
    
    @IBAction func nextBarButtonItem(sender: UIBarButtonItem)
    {
        
        var numeroAleatorio = Int(arc4random_uniform(UInt32(tigersArray.count)))
        
        //si el numero aleatorio es igual al numero anterior
        //if random is same to previous
        if numeroAleatorio == self.previousNumber{
            //Y es el primer item del array
            //and if it's the first item of the array
            if numeroAleatorio == 0{
                numeroAleatorio += 1
            }
            //si es el ultimo item del array
            //if it's the last item of the array
            else if numeroAleatorio == (self.tigersArray.count) - 1{
                numeroAleatorio -= 1
            }
            //si el numero no es ni el primero ni el ultimo
            //if it's not the first nor the last
            else{
                //para que todo sea aleatorio creamos un 1 o un 0 aleatorio, si el numero es 1 suma y si es 0 resta
                //I love random so a random 1 or 0 to add or substract 1. If it's a 1 we add and if it's a 0 we substract
                var randomAddOrSubstract = Int(arc4random_uniform(UInt32(2)))
                if randomAddOrSubstract == 1{
                    numeroAleatorio += 1
                }else{
                    numeroAleatorio -= 1
                }
            }
        }else{
            //el numero aleatorio no es el mismo que el anterior
            //the random number is not the same than the previous
        }
        
        //animando la transicion entre vistas
        //animating transitions between views
        UIView.transitionWithView(self.view, duration: 0.8, options: UIViewAnimationOptions.TransitionCrossDissolve, animations:{
            self.myImageView.image = self.tigersArray[numeroAleatorio].image
            self.nameLabel.text = self.tigersArray[numeroAleatorio].name
            self.ageLabel.text = ("\(self.tigersArray[numeroAleatorio].age)")
            self.breedLabel.text = self.tigersArray[numeroAleatorio].breed
            }, completion: { (finished:Bool) -> () in
        })
        
        
        previousNumber = numeroAleatorio
    }
    
    @IBAction func CuffBarButtonItem(sender: UIBarButtonItem)
    {
        //cuando apretamos el boton chuff, se reproduce el video donde el tigre hace chuff chuff
        //when we press the chuff button, it plays the video where the tiger says chuff chuff
        self.videoWebView.hidden = false
        
        var url = NSURL.URLWithString("http://www.youtube.com/embed/5Ksr0-H1gmI")
        var urlRequest = NSURLRequest( URL: url)
        self.videoWebView .loadRequest(urlRequest)
    }

}

