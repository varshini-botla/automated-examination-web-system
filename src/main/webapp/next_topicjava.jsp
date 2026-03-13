<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Advanced Java - Next Topic</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #4facfe, #00f2fe); /* Soft gradient background */
            color: #333;
            padding: 30px;
            line-height: 1.6;
        }

        .container {
            max-width: 1000px;
            margin: 0 auto;
            background-color: #ffffff;
            border-radius: 12px;
            padding: 40px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 2.5rem;
            color: #2C3E50;
            margin-bottom: 20px;
            font-weight: 600;
            text-align: center;
        }

        h2, h3 {
            color: #2980B9;
            margin-bottom: 15px;
        }

        .section-block {
            margin-bottom: 30px;
            border-radius: 10px;
            padding: 20px;
            color: #333;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background: #ffffff;
        }

        .code-section {
            background-color: #f1f1f1;
            padding: 20px;
            border-radius: 8px;
            border-left: 5px solid #2980B9;
            margin-top: 20px;
            font-family: monospace;
            font-size: 1.1rem;
            color: #34495E;
        }

        .cta-button {
            text-decoration: none;
            background-color: #2980B9;
            color: #fff;
            padding: 15px 25px;
            font-size: 1.2rem;
            border-radius: 50px;
            transition: background-color 0.3s ease;
            display: inline-block;
            margin-top: 20px;
        }

        .cta-button:hover {
            background-color: #3498DB;
        }

        .back-btn {
            text-decoration: none;
            padding: 12px 20px;
            background-color: #27AE60;
            color: white;
            border-radius: 5px;
            font-size: 16px;
            margin-top: 20px;
            display: inline-block;
            transition: background-color 0.3s ease;
        }

        .back-btn:hover {
            background-color: #2ECC71;
        }

        .footer {
            text-align: center;
            padding: 20px;
            margin-top: 50px;
            background-color: #2C3E50;
            color: white;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Advanced Java - Understanding Data Types and Type Casting</h1>
    
    <div class="section-block">
        <h2>Java Data Types</h2>
        <p>
            As explained in the previous chapter, a variable in Java must have a specified data type. Java has two categories of data types: primitive and non-primitive.
        </p>
    </div>

    <div class="section-block">
        <h3>Primitive Data Types</h3>
        <p>
            There are eight primitive data types in Java. Each data type specifies the type of values a variable can hold:
        </p>
        <ul>
            <li><strong>byte:</strong> Stores whole numbers from -128 to 127</li>
            <li><strong>short:</strong> Stores whole numbers from -32,768 to 32,767</li>
            <li><strong>int:</strong> Stores whole numbers from -2,147,483,648 to 2,147,483,647</li>
            <li><strong>long:</strong> Stores whole numbers from -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807</li>
            <li><strong>float:</strong> Stores fractional numbers (6-7 decimal digits)</li>
            <li><strong>double:</strong> Stores fractional numbers (15-16 decimal digits)</li>
            <li><strong>boolean:</strong> Stores true or false values</li>
            <li><strong>char:</strong> Stores a single character/letter or ASCII values</li>
        </ul>
    </div>

    <div class="section-block">
        <h3>Non-Primitive Data Types</h3>
        <p>
            Non-primitive data types include objects and arrays. These are defined by the user and can be more complex than primitive types. A commonly used non-primitive data type is <strong>String</strong>.
        </p>
    </div>

    <div class="section-block">
        <h2>Java Type Casting</h2>
        <p>
            Type casting in Java is when you assign a value of one primitive data type to another. There are two main types of casting: <strong>widening</strong> and <strong>narrowing</strong>.
        </p>
    </div>

    <div class="section-block">
        <h3>Widening Casting (Automatic)</h3>
        <p>
            Widening casting happens automatically when a smaller data type is assigned to a larger one. For example, converting an <strong>int</strong> to a <strong>double</strong> is automatic.
        </p>

        <div class="code-section">
            <strong>Example of Widening Casting:</strong><br><br>
            <pre>
            public class Main {
                public static void main(String[] args) {
                    int myInt = 9;
                    double myDouble = myInt; // Automatic casting: int to double

                    System.out.println(myInt);      // Outputs 9
                    System.out.println(myDouble);   // Outputs 9.0
                }
            }
            </pre>
        </div>
    </div>

    <div class="section-block">
        <h3>Narrowing Casting (Manual)</h3>
        <p>
            Narrowing casting requires explicit conversion, usually by placing the target data type in parentheses before the value. For example, converting a <strong>double</strong> to an <strong>int</strong> requires manual casting.
        </p>

        <div class="code-section">
            <strong>Example of Narrowing Casting:</strong><br><br>
            <pre>
            public class Main {
                public static void main(String[] args) {
                    double myDouble = 9.78d;
                    int myInt = (int) myDouble; // Manual casting: double to int

                    System.out.println(myDouble);   // Outputs 9.78
                    System.out.println(myInt);      // Outputs 9
                }
            }
            </pre>
        </div>
    </div>

    <div class="section-block">
        <h3>Real-Life Example</h3>
        <p>
            Here's a real-life example of type casting, where we calculate the percentage of a user's score in a game. The division needs to be accurate, so we convert the score to a floating-point number:
        </p>

        <div class="code-section">
            <strong>Real-Life Example Code:</strong><br><br>
            <pre>
            public class Main {
                public static void main(String[] args) {
                    // Set the maximum possible score in the game
                    int maxScore = 500;

                    // The actual score of the user
                    int userScore = 423;

                    // Calculate the percentage of the user's score in relation to the maximum available score
                    float percentage = (float) userScore / maxScore * 100.0f;

                    System.out.println("User's percentage is " + percentage);
                }
            }
            </pre>
        </div>
    </div>
<div>
    <div class="button-container">
        <a href="next_topic.jsp" class="cta-button">Start the Next Topic</a>
        <div class="button-container">
        <a href="java_subject.jsp" class="back-btn">Previous</a>
    </div>
    </div>

    <div class="button-container">
        <a href="java_subject.jsp" class="back-btn">Previous</a>
    </div>
    
    <div class="button-container">
        <a href="java_datatypes.jsp" class="back-btn">Take Quiz</a>
    </div>
</div>

<div class="footer">
    <p>&copy; 2025 Advanced Java Programming. All Rights Reserved.</p>
</div>

</body>
</html>
