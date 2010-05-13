﻿TestCase subclass: #DistanceTest
	
	self error: 'Este metodo debe devolver el objeto que la unidad de distancia centimetro'! !
	
	self error: 'Este metodo debe devolver el objeto que la unidad de distancia decametro'! !
	
	self error: 'Este metodo debe devolver el objeto que la unidad de distancia decimetro'! !
	
	self error: 'Este metodo debe devolver el objeto que la unidad de distancia hectometro'! !
	
	self error: 'Este metodo debe devolver el objeto que la unidad de distancia kilometro'! !

	self error: 'Este metodo debe devolver el objeto que la unidad de distancia metro'! !
	
	self error: 'Este metodo debe devolver el objeto que la unidad de distancia millimetro'! !
	
	self error: 'Este metodo debe devolver un objeto que represente un centimetro'! !
	
	self error: 'Este metodo debe devolver un objeto que represente cien centimetros'! !
	
	self error: 'Este metodo debe devolver un objeto que represente un metro'! !
	
	self error: 'Este metodo debe devolver un objeto que represente doscientos centimetros'! !
	
	self error: 'Este metodo debe devolver un objeto que represente dos metros'! !

	self error: 'Este metodo debe devolver un objeto que represente cero metros'! !

	"Verifico no solo el protocolo de accessing sino tambien que los objetos
	que se utilizan esten bien construidos, o sea, que 1 metro sea 1 metro y no 100 centimetros"
	self assert: self oneMeter amount = 1.
	self assert: self oneMeter unit = self meter.

	self assert: self twoMeters amount = 2.
	self assert: self twoMeters unit = self meter.

	self assert: self oneHundredCentimeters amount = 100.
	self assert: self oneHundredCentimeters unit = self centimeter.

	self assert: self twoHundredCentimeters amount = 200.
	self assert: self twoHundredCentimeters unit = self centimeter.! !

	self assert: self oneMeter = self oneMeter.
	self deny: self oneMeter = self twoMeters.
	
	self assert: self oneHundredCentimeters = self oneHundredCentimeters.
	self deny: self oneHundredCentimeters = self twoHundredCentimeters.
	

! !

	self assert: self oneMeter = self oneHundredCentimeters.
	"Este assert no es redundante. Verifica que la igualdad en conmutativa"
	self assert: self oneHundredCentimeters = self oneMeter.

	self assert: self twoMeters = self twoHundredCentimeters.
	self assert: self twoHundredCentimeters = self twoMeters
! !

	"A partir del test anterior, se deben haber dado cuenta que debemos poder
	convertir distancias a distintas unidades... y que ademas dos distancias de distintas unidades
	pueden ser iguales... Por lo tanto ¬øpor que no hacer esta caracteristica de las distancias explicita?
	Veran que luego se torna muy util
	
	Respecto de como esta escrito el test, para no tener que escribir los assert para oneMeter y oneHundredCentimeters 
	creo un array y lo recorro... ¬øSe podria escribir menos aun en este test?"
	
	(Array with: self oneMeter with: self oneHundredCentimeters) do: [ :aDistance |
		self assert: (aDistance convertTo: self meter) amount = 1.
		self assert: (aDistance convertTo: self meter) unit = self meter.
		
		self assert: (aDistance convertTo: self decimeter) amount = 10.
		self assert: (aDistance convertTo: self decimeter) unit = self decimeter.
		
		self assert: (aDistance convertTo: self centimeter) amount = 100.
		self assert: (aDistance convertTo: self centimeter) unit = self centimeter.
		
		self assert: (aDistance convertTo: self millimeter) amount = 1000.
		self assert: (aDistance convertTo: self millimeter) unit = self millimeter.
	
		self assert: (aDistance convertTo: self decameter) amount = (1/10).
		self assert: (aDistance convertTo: self decameter) unit = self decameter.
		
		self assert: (aDistance convertTo: self hectometer) amount = (1/100).
		self assert: (aDistance convertTo: self hectometer) unit = self hectometer.
	
		self assert: (aDistance convertTo: self kilometer) amount = (1/1000).
		self assert: (aDistance convertTo: self kilometer) unit = self kilometer ]! !

	self assert: self oneMeter ~= self twoMeters.
	self assert: self twoMeters ~= self oneMeter! !

	"El igual no debe generar ningun tipo de error por mas que se comparen objetos
	de distintos tipos
	Fijense como se crea una instancia de Object sin ningun tipo de problema... ¬øque representa?"

	self deny: self oneMeter = Object new.
	self deny: Object new = self oneMeter! !

	"Dos objetos que ocupan distintas posiciones de memoria pero representan
	la misma entidad de la realidad, deben devolver true cuando se los compara por igual, puesto
	que representan la misma entidad de la realidad.
	Tener en cuenta que el mensaje #== significa que ocupan la misma posicion de memoria"

	| originalOneMeter copiedOneMeter |

	"Al objeto oneMeter lo copio para asegurarme de tener uno oneMeter en otra posicion de memoria"

	originalOneMeter := self oneMeter.
	copiedOneMeter := originalOneMeter copy.

	"Me aseguro que ocupen distinta posicion de memoria"
	self deny: originalOneMeter == copiedOneMeter.

	"Ahora me aseguro que sean iguales"
	self assert: originalOneMeter = copiedOneMeter! !

	"Debido a como funcionan los diccionarios, cuando dos objetos son iguales deben
	tener es mismo hash. La inversa no es verdad"
	
	self assert: self oneMeter hash=self oneMeter hash.
	self assert: self oneMeter hash=self oneHundredCentimeters hash.

	
	
! !

	self assert: (self oneMeter + self oneMeter) = self twoMeters

! !

	self assert: (self oneMeter + self oneHundredCentimeters) = self twoMeters

! !

	self assert: (self oneMeter + self twoMeters)=(self twoMeters + self oneMeter)


! !

	self assert: 
		((self oneMeter + self oneMeter) + self twoMeters) = 
		(self oneMeter + (self oneMeter + self twoMeters))


! !

	self assert: self oneMeter negated amount=self oneMeter amount negated.
	self assert: self oneMeter negated negated=self oneMeter.
	
! !

	self assert: (self twoMeters - self oneMeter) = self oneMeter.
	self assert: (self oneMeter - self oneMeter) = self zeroMeters.
	self assert: (self oneMeter - self twoMeters) = self oneMeter negated
	

	! !

	self assert: (self twoMeters - self oneHundredCentimeters) = self oneMeter.
	self assert: (self oneMeter - self oneHundredCentimeters) = self zeroMeters.
	self assert: (self oneHundredCentimeters - self twoMeters) = self oneMeter negated
	

	! !

	self assert: 
		((self twoMeters - self oneMeter) - self oneMeter) = 
		(self twoMeters - (self oneMeter + self oneMeter)).

	

	! !

	self assert: self oneMeter * 1 = self oneMeter.
	self assert: self oneMeter * 2 = self twoMeters.
	self assert: self oneMeter * 0 = self zeroMeters.
! !

	self assert: ((self oneMeter * 2) * 5) = (self oneMeter * (2 * 5))
! !

	self assert: (self oneMeter / 1) = self oneMeter.
	self assert: (self twoMeters / 2) = self oneMeter.


! !

	self assert: (self oneMeter * 10 / 10) = self oneMeter.
	self assert: (self oneMeter / 10 * 10) = self oneMeter.

	self assert: (self oneMeter * 8 / 4) = self twoMeters.
	self assert: (self oneMeter / 4 * 8) = self twoMeters.
! !

	self assert: self oneMeter < self twoMeters.
	self deny: self twoMeters < self oneMeter.
	
	"Me aseguro que funcione para distancias negativas y cero"
	self assert: self oneMeter negated < self oneMeter.
	self assert: self zeroMeters < self oneMeter.
	self deny: self zeroMeters < self oneMeter negated.
	! !

	self assert: self twoMeters > self oneMeter.
	self deny: self oneMeter > self twoMeters.
	
	"Me aseguro que funcione para distancias negativas y cero"
	self deny: self oneMeter negated > self oneMeter.
	self deny: self zeroMeters > self oneMeter.
	self assert: self zeroMeters > self oneMeter negated.
	! !

	self assert: self oneMeter <= self twoMeters.
	self deny: self twoMeters <= self oneMeter.

	self assert: self oneMeter <= self oneMeter.
	
! !

	self assert: self twoMeters >= self oneMeter.
	self deny: self oneMeter >= self twoMeters.
	
	self assert: self oneMeter >= self oneMeter.
	
! !

	self assert: self oneMeter < self twoHundredCentimeters.
	self deny: self twoHundredCentimeters < self oneMeter.
	
	self assert: self oneHundredCentimeters < self twoMeters.
	self deny: self twoMeters < self oneHundredCentimeters.
! !

	self assert: self twoMeters > self oneHundredCentimeters.
	self deny: self oneHundredCentimeters > self twoMeters.

	self assert: self twoHundredCentimeters > self oneMeter.
	self deny: self oneMeter > self twoHundredCentimeters 
! !

	self assert: self oneMeter <= self twoHundredCentimeters.
	self deny: self twoMeters <= self oneHundredCentimeters.

	self assert: self oneHundredCentimeters <= self twoMeters.
	self deny: self twoHundredCentimeters <= self oneMeter.

	self assert: self oneMeter <= self oneHundredCentimeters.
	self assert: self oneHundredCentimeters <= self oneMeter.
	
! !

	self assert: self twoMeters >= self oneHundredCentimeters.
	self deny: self oneHundredCentimeters >= self twoMeters.
	
	self assert: self twoHundredCentimeters >= self oneMeter.
	self deny: self oneMeter >= self twoHundredCentimeters.

	self assert: self oneMeter >= self oneHundredCentimeters.
	self assert: self oneHundredCentimeters >= self oneMeter.	
! !

	self assert: (self twoMeters max: self oneMeter) = self twoMeters.
	self assert: (self oneMeter max: self twoMeters) = self twoMeters.

	self assert: (self twoMeters max: self oneHundredCentimeters) = self twoMeters.
	self assert: (self oneHundredCentimeters max: self twoMeters) = self twoMeters.

	
! !

	self assert: (self twoMeters min: self oneMeter) = self oneMeter.
	self assert: (self oneMeter min: self twoMeters) = self oneMeter.

	self assert: (self twoMeters min: self oneHundredCentimeters) = self oneHundredCentimeters.
	self assert: (self oneHundredCentimeters min: self twoMeters) = self oneHundredCentimeters.

	
! !

	self assert: (self oneMeter between: self zeroMeters and: self twoMeters).
	self assert: (self oneHundredCentimeters between: self zeroMeters and: self twoMeters).
	
	self deny: (self twoMeters between: self zeroMeters and: self oneMeter).
	self deny: (self twoHundredCentimeters between: self zeroMeters and: self oneMeter).

! !

	self assert: (self oneMeter to: self twoMeters) from=self oneMeter.
	self assert: (self oneMeter to: self twoMeters) to=self twoMeters.
	self assert: (self oneMeter to: self twoMeters) by=self oneMeter.	

	self assert: (self oneHundredCentimeters to: self twoMeters) from=self oneMeter.
	self assert: (self oneHundredCentimeters to: self twoMeters) to=self twoMeters.
	self assert: (self oneHundredCentimeters to: self twoMeters) by=self oneCentimeter.	
	! !

	self assert: (self zeroMeters to: (self twoMeters * 2) by: self twoMeters) from=self zeroMeters.
	self assert: (self zeroMeters to: (self twoMeters * 2) by: self twoMeters) to=(self twoMeters * 2).
	self assert: (self zeroMeters to: (self twoMeters * 2) by: self twoMeters) by=self twoMeters.

	self assert: ((self twoMeters * 2) to: self zeroMeters by: self twoMeters negated) from=(self twoMeters * 2).
	self assert: ((self twoMeters * 2) to: self zeroMeters by: self twoMeters negated) to=self zeroMeters.
	self assert: ((self twoMeters * 2) to: self zeroMeters by: self twoMeters negated) by=self twoMeters negated

	! !

	self assert: (self zeroMeters to: (self twoMeters * 2) ) size =5.
	self assert: ((self twoMeters * 2) to: self zeroMeters by: self oneMeter negated) size =5.
! !

	| value |
	
	value := 1.
	(self oneMeter to: (self oneMeter * 10)) do: [ :aDistance |
		self assert: aDistance amount = value.
		value := value + 1 ].
	
	self assert: value = 11
! !

	| value |
	
	value := 1.
	(self oneMeter to: (self oneMeter * 10) by: self twoMeters) do: [ :aDistance |
		self assert: aDistance amount = value.
		value := value + 2 ].
	
	self assert: value = 11
! !