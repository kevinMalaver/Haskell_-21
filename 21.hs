import System.Random

aleatorio n = randomRIO (0, n)

lista = []
foo :: Int -> Int -> Int
foo x y = x + y

getInt :: IO Int
getInt = do line <- getLine
            return (read line :: Int)
			
funcion:: [String] -> Int -> String 
funcion (x:xs) 0 = x
funcion (x:xs) y = funcion (xs) (y-1)

escribir::String->IO ()
escribir m= do putStr m

replazar :: String ->Int
replazar x = read x :: Int

mostrarNumero :: Int-> IO()
mostrarNumero x = do print x

sumar :: [Int] -> Int
sumar [ ] = 0
sumar (x:xs) = x + sumar xs
	
comparar :: String -> Int
comparar z = do
	if (z == "A") then ( replazar "11")
	else 
		if ((z == "Q") || (z == "J") || (z == "K")) then ( replazar "10" )
		else  replazar z
		

cartas :: IO ()
cartas = do
	x <- randomRIO (0, 12)
	y <- randomRIO (0, 3)
	let z = funcion ["A","2","3","4","5","6","7","8","9","10","J","Q","K"] x
	escribir (z)
	escribir " de "
	escribir (funcion ["Pica","Corazon", "Trebol", "Diamante"] y)
	escribir "\n"
	
pedir :: IO()
pedir = do
	escribir "1 pedir 0 terminar juego\n"
	n <- getInt
	if (n == 1) then (do 
						cartas 
						pedir)
	else (do 
			escribir "fin del juego\n")

juego :: IO ()
juego = do 
	cartas
	cartas
	pedir
	

	
	