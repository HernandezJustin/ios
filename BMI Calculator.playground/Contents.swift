//This code will calculate the users BMI based on weight and height and return a status message
import UIKit

func calculateBMI(mass: Float, height: Float) -> String {
    let bmi = (mass / (height * height))
    
    if bmi > 25 {
        return "User is overweight"
    }
    else if bmi > 18.5 && bmi < 25 {
        return "User is of normal weight"
    }
    else{
        return "User is underweight"
    }
}

calculateBMI(mass: 50, height: 1.3288)