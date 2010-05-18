﻿TestCase subclass: #MeasureTest
	
	self error: 'Este metodo debe devolver el objeto que representa que no se pudo
		convertir una medida a la unidad pedida'! !
	
	self error: 'Este metodo debe devolver un objeto que la unidad de temperatura Celsius'! !
	
	self error: 'Este metodo debe devolver un objeto que represente la unidad de temperatura Fahrenheit'! !
	
	self error: 'Este metodo debe devolver el objeto que la unidad de distancia centimetro'! !
	
	self error: 'Este metodo debe devolver el objeto que la unidad de distancia decametro'! !
	
	self error: 'Este metodo debe devolver el objeto que la unidad de distancia decimetro'! !
	
	self error: 'Este metodo debe devolver el objeto que la unidad de distancia hectometro'! !
	
	self error: 'Este metodo debe devolver el objeto que la unidad de distancia kilometro'! !

	self error: 'Este metodo debe devolver el objeto que la unidad de distancia metro'! !
	
	self error: 'Este metodo debe devolver el objeto que la unidad de distancia millimetro'! !
	
	self error: 'Este metodo debe devolver un objeto que represente la unidad dia'! !
	
	self error: 'Este metodo debe devolver un objeto que represente la unidad hora'! !
	
	self error: 'Este metodo debe devolver un objeto que represente la unidad minuto'! !
	
	self error: 'Este metodo debe devolver un objeto que represente la unidad segundo'! !
	
	self error: 'Este metodo debe devolver un objeto que represente un grado centigrado'! !
	
	self error: 'Este metodo debe devolver un objeto que represente 32 fahrenhetis, o sea
	0 grados centigrados'! !
	
	self error: 'Este metodo debe devolver un objeto que represente dos grados centigrados'! !
	
	self error: 'Este metodo debe devolver un objeto que represente cero grados centrigrados'! !
	
	self error: 'Este metodo debe devolver un objeto que represente un centimetro'! !
	
	self error: 'Este metodo debe devolver un objeto que represente cien centimetros'! !
	
	self error: 'Este metodo debe devolver un objeto que represente un metro'! !
	
	self error: 'Este metodo debe devolver un objeto que represente doscientos centimetros'! !
	
	self error: 'Este metodo debe devolver un objeto que represente dos metros'! !

	self error: 'Este metodo debe devolver un objeto que represente cero metros'! !
	
	self error: 'Este metodo debe devolver un objeto que represente un dia'! !
	
	self error: 'Este metodo debe devolver un objeto que represente una hora'! !
	
	self error: 'Este metodo debe devolver un objeto que represente un minuto'! !

	self error: 'Este metodo debe devolver un objeto que represente un segundo'! !
	
	self error: 'Este metodo debe devolver un objeto que represente sesenta minutos'! !
	
	self error: 'Este metodo debe devolver un objeto que represente sesenta y un segundos'! !
	
	self error: 'Este metodo debe devolver un objeto que represente sesenta segundos'! !
	
	self error: 'Este metodo debe devolver un objeto que represente veinticuatros horas'! !
	
	self error: 'Este metodo debe devolver un objeto que represente dos segundos'! !
	
	self error: 'Este metodo debe devolver un objeto que represente cero segundos'! !

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
	
	self assert: self oneSecond = self oneSecond.
	self deny: self oneSecond = self sixtySeconds.
	
	self assert: self oneCelsius = self oneCelsius.
	self deny: self oneCelsius = self zeroCelsius.

! !

	self assert: self oneMeter = self oneHundredCentimeters.
	"Este assert no es redundante. Verifica que la igualdad en conmutativa"
	self assert: self oneHundredCentimeters = self oneMeter.

	self assert: self twoMeters = self twoHundredCentimeters.
	self assert: self twoHundredCentimeters = self twoMeters.
	
	self assert: self oneMinute = self sixtySeconds.
	self assert: self zeroCelsius = self thirtyTwoFahrenheits.
! !

	self deny: self oneMeter = self oneSecond.
	self deny: self oneMeter = self oneCelsius.
	self deny: self oneCelsius = self oneSecond.! !

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

	self assert: (self oneMinute convertTo: self second) = self sixtySeconds.
	self assert: (self sixtySeconds convertTo: self minute) = self oneMinute.

	self assert: (self oneHour convertTo: self minute) = self sixtyMinutes.
	self assert: (self sixtyMinutes convertTo: self hour) = self oneHour.

	self assert: (self oneDay convertTo: self hour) = self twentyFourHours.
	self assert: (self twentyFourHours convertTo: self day) = self oneDay.
! !

	self assert: (self zeroCelsius convertTo: self fahrenheit) = self thirtyTwoFahrenheits.
	self assert: (self thirtyTwoFahrenheits convertTo: self celsius) = self zeroCelsius.
! !

	self should: [ self oneMeter convertTo: self second ] raise: self canNotConvertMeasurementException.

! !

	self assert: self oneMeter ~= self twoMeters.
	self assert: self oneSecond ~= self sixtySeconds.
	self assert: self oneCelsius ~= self zeroCelsius.! !

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
	
	self assert: self oneMinute hash = self sixtySeconds hash.
	self assert: self zeroCelsius hash = self thirtyTwoFahrenheits hash

	
	
! !

	self assert: (self oneMeter + self oneMeter) = self twoMeters.
	self assert: (self oneSecond + self oneSecond) = self twoSeconds.
	self assert: (self oneCelsius + self oneCelsius) = self twoCelsius.

! !

	self assert: (self oneMeter + self oneHundredCentimeters) = self twoMeters.
	self assert: (self oneSecond + self oneMinute) = self sixtyOneSeconds.

! !

	self assert: (self oneMeter + self twoMeters)=(self twoMeters + self oneMeter).
	self assert: (self oneSecond + self twoSeconds)=(self twoSeconds + self oneSecond).
	self assert: (self oneCelsius + self twoCelsius)=(self twoCelsius + self oneCelsius)


! !

	self assert: 
		((self oneMeter + self oneMeter) + self twoMeters) = 
		(self oneMeter + (self oneMeter + self twoMeters)).

	self assert: 
		((self oneSecond + self oneSecond) + self twoSeconds) = 
		(self oneSecond + (self oneSecond + self twoSeconds)).

	self assert: 
		((self oneCelsius + self oneCelsius) + self twoCelsius) = 
		(self oneCelsius + (self oneCelsius + self twoCelsius)).


! !

	(Array with: self oneMeter with: self twoSeconds with: self thirtyTwoFahrenheits) do: [:aMeasure |
		self assert: aMeasure negated amount=aMeasure amount negated.
		self assert: aMeasure negated negated=aMeasure ].
	
! !

	self assert: (self twoMeters - self oneMeter) = self oneMeter.
	self assert: (self oneMeter - self oneMeter) = self zeroMeters.
	self assert: (self oneMeter - self twoMeters) = self oneMeter negated.
	
	self assert: (self twoSeconds - self oneSecond) = self oneSecond.
	self assert: (self oneSecond - self oneSecond) = self zeroSeconds.
	self assert: (self oneSecond - self twoSeconds) = self oneSecond negated.
	
	self assert: (self twoCelsius - self oneCelsius) = self oneCelsius.
	self assert: (self oneCelsius - self oneCelsius) = self zeroCelsius.
	self assert: (self oneCelsius - self twoCelsius) = self oneCelsius negated.

	! !

	self assert: (self twoMeters - self oneHundredCentimeters) = self oneMeter.
	self assert: (self oneMeter - self oneHundredCentimeters) = self zeroMeters.
	self assert: (self oneHundredCentimeters - self twoMeters) = self oneMeter negated.
	
	self assert: (self sixtyOneSeconds - self oneMinute) = self oneSecond.
	
	! !

	self assert: 
		((self twoMeters - self oneMeter) - self oneMeter) = 
		(self twoMeters - (self oneMeter + self oneMeter)).

	self assert: 
		((self twoSeconds - self oneSecond) - self oneSecond) = 
		(self twoSeconds - (self oneSecond + self oneSecond)).	

	! !

	self assert: self oneMeter * 1 = self oneMeter.
	self assert: self oneMeter * 2 = self twoMeters.
	self assert: self oneMeter * 0 = self zeroMeters.

	self assert: self oneSecond * 1 = self oneSecond.
	self assert: self oneSecond * 2 = self twoSeconds.
	self assert: self oneSecond * 0 = self zeroSeconds.

	self assert: self oneCelsius * 1 = self oneCelsius.
	self assert: self oneCelsius * 2 = self twoCelsius.
	self assert: self oneCelsius * 0 = self zeroCelsius.
! !

	self assert: ((self oneMeter * 2) * 5) = (self oneMeter * (2 * 5)).
	self assert: ((self oneSecond * 2) * 5) = (self oneSecond * (2 * 5)).
	self assert: ((self oneCelsius * 2) * 5) = (self oneCelsius * (2 * 5))
	
! !

	self assert: (self oneMeter * 2) = (2 * self oneMeter).
	self assert: (self oneSecond * 1) = (1 * self oneSecond).
	self assert: (self oneCelsius * 0) = (0 * self oneCelsius)
	
! !

	self assert: (self oneMeter / 1) = self oneMeter.
	self assert: (self twoMeters / 2) = self oneMeter.

	self assert: (self oneSecond / 1) = self oneSecond.
	self assert: (self twoSeconds / 2) = self oneSecond.

	self assert: (self oneCelsius / 1) = self oneCelsius.
	self assert: (self twoCelsius / 2) = self oneCelsius.
! !

	self assert: (self oneMeter * 10 / 10) = self oneMeter.
	self assert: (self oneMeter / 10 * 10) = self oneMeter.

	self assert: (self oneMeter * 8 / 4) = self twoMeters.
	self assert: (self oneMeter / 4 * 8) = self twoMeters.

	self assert: (self oneSecond * 10 / 10) = self oneSecond.
	self assert: (self oneSecond / 10 * 10) = self oneSecond.

	self assert: (self oneSecond * 8 / 4) = self twoSeconds.
	self assert: (self oneSecond / 4 * 8) = self twoSeconds.
	
	self assert: (self oneCelsius * 10 / 10) = self oneCelsius.
	self assert: (self oneCelsius / 10 * 10) = self oneCelsius.

	self assert: (self oneCelsius * 8 / 4) = self twoCelsius.
	self assert: (self oneCelsius / 4 * 8) = self twoCelsius.	! !

	self assert: self oneMeter < self twoMeters.
	self deny: self twoMeters < self oneMeter.
	
	self assert: self oneSecond < self twoSeconds.
	self deny: self twoSeconds < self oneSecond.

	self assert: self oneCelsius < self twoCelsius.
	self deny: self twoCelsius < self oneCelsius.

	"Me aseguro que funcione para distancias negativas y cero"
	self assert: self oneMeter negated < self oneMeter.
	self assert: self zeroMeters < self oneMeter.
	self deny: self zeroMeters < self oneMeter negated.
	! !

	self assert: self twoMeters > self oneMeter.
	self deny: self oneMeter > self twoMeters.
	
	self assert: self twoSeconds > self oneSecond.
	self deny: self oneSecond > self twoSeconds.

	self assert: self twoCelsius > self oneCelsius.
	self deny: self oneCelsius > self twoCelsius.

	"Me aseguro que funcione para distancias negativas y cero"
	self deny: self oneMeter negated > self oneMeter.
	self deny: self zeroMeters > self oneMeter.
	self assert: self zeroMeters > self oneMeter negated.
	! !

	self assert: self oneMeter <= self twoMeters.
	self deny: self twoMeters <= self oneMeter.
	self assert: self oneMeter <= self oneMeter.
	
	self assert: self oneSecond <= self twoSeconds.
	self deny: self twoSeconds <= self oneSecond.
	self assert: self oneSecond <= self oneSecond.
	
	self assert: self oneCelsius <= self twoCelsius.
	self deny: self twoCelsius <= self oneCelsius.
	self assert: self oneCelsius <= self oneCelsius.
! !

	self assert: self twoMeters >= self oneMeter.
	self deny: self oneMeter >= self twoMeters.
	self assert: self oneMeter >= self oneMeter.
	
	self assert: self twoSeconds >= self oneSecond.
	self deny: self oneSecond >= self twoSeconds.
	self assert: self oneSecond >= self oneSecond.

	self assert: self twoCelsius >= self oneCelsius.
	self deny: self oneCelsius >= self twoCelsius.
	self assert: self oneCelsius >= self oneCelsius.
! !

	self assert: self oneMeter < self twoHundredCentimeters.
	self deny: self twoHundredCentimeters < self oneMeter.
	
	self assert: self oneSecond < self oneMinute.
	self deny: self oneMinute < self oneSecond.
	
	self assert: self oneCelsius negated < self thirtyTwoFahrenheits.
	self deny: self thirtyTwoFahrenheits < self oneCelsius negated! !

	self assert: self twoMeters > self oneHundredCentimeters.
	self deny: self oneHundredCentimeters > self twoMeters.

	self assert: self oneMinute > self oneSecond.
	self deny: self oneSecond > self oneMinute.
	
	self assert: self twoCelsius > self thirtyTwoFahrenheits.
	self deny: self thirtyTwoFahrenheits > self twoCelsius! !

	self assert: self oneMeter <= self twoHundredCentimeters.
	self assert: self oneMeter <= self oneHundredCentimeters.

	self assert: self oneSecond <= self oneMinute.
	self assert: self oneMinute <= self sixtySeconds.
	
	self assert: self zeroCelsius <= self thirtyTwoFahrenheits.
	self assert: self thirtyTwoFahrenheits <= self oneCelsius
	
! !

	self assert: self twoMeters >= self oneHundredCentimeters.
	self assert: self oneMeter >= self oneHundredCentimeters.

	self assert: self oneMinute >= self oneSecond.
	self assert: self oneMinute >= self sixtySeconds.
	
	self assert: self twoCelsius >= self thirtyTwoFahrenheits.
	self assert: self thirtyTwoFahrenheits >= self oneCelsius negated! !

	self assert: (self twoMeters max: self oneMeter) = self twoMeters.
	self assert: (self oneMeter max: self twoMeters) = self twoMeters.

	self assert: (self twoSeconds max: self oneSecond) = self twoSeconds.
	self assert: (self oneSecond max: self twoSeconds) = self twoSeconds.

	self assert: (self twoCelsius max: self oneCelsius) = self twoCelsius.
	self assert: (self oneCelsius max: self twoCelsius) = self twoCelsius.
	


	
! !

	self assert: (self twoMeters min: self oneMeter) = self oneMeter.
	self assert: (self oneMeter min: self twoMeters) = self oneMeter.

	self assert: (self twoSeconds min: self oneSecond) = self oneSecond.
	self assert: (self oneSecond min: self twoSeconds) = self oneSecond.

	self assert: (self twoCelsius min: self oneCelsius) = self oneCelsius.
	self assert: (self oneCelsius min: self twoCelsius) = self oneCelsius.
	
! !

	self assert: (self oneMeter between: self zeroMeters and: self twoMeters).
	self deny: (self twoMeters between: self zeroMeters and: self oneMeter).

	self assert: (self oneSecond between: self zeroSeconds and: self twoSeconds).
	self deny: (self twoSeconds between: self zeroSeconds and: self oneSecond).
	
	self assert: (self oneCelsius between: self zeroCelsius and: self twoCelsius).
	self deny: (self twoCelsius between: self zeroCelsius and: self oneCelsius).

! !

	self should: [ self oneMeter < self oneSecond ] raise: self canNotConvertMeasurementException.
	self should: [ self oneMeter > self oneSecond ] raise: self canNotConvertMeasurementException.
	self should: [ self oneMeter <= self oneSecond ] raise: self canNotConvertMeasurementException.
	self should: [ self oneMeter >= self oneSecond ] raise: self canNotConvertMeasurementException.
	self should: [ self oneMeter max: self oneSecond ] raise: self canNotConvertMeasurementException.
	self should: [ self oneMeter min: self oneSecond ] raise: self canNotConvertMeasurementException.
	self should: [ self oneMeter between: self oneSecond and: self twoSeconds ] raise: self canNotConvertMeasurementException.
! !

	self assert: (self oneMeter to: self twoMeters) from=self oneMeter.
	self assert: (self oneMeter to: self twoMeters) to=self twoMeters.
	self assert: (self oneMeter to: self twoMeters) by=self oneMeter.	

	self assert: (self oneSecond to: self twoSeconds) from=self oneSecond.
	self assert: (self oneSecond to: self twoSeconds) to=self twoSeconds.
	self assert: (self oneSecond to: self twoSeconds) by=self oneSecond.	

	self assert: (self oneCelsius to: self twoCelsius) from=self oneCelsius.
	self assert: (self oneCelsius to: self twoCelsius) to=self twoCelsius.
	self assert: (self oneCelsius to: self twoCelsius) by=self oneCelsius.	
! !

	self assert: (self zeroMeters to: (self twoMeters * 2) by: self twoMeters) from=self zeroMeters.
	self assert: (self zeroMeters to: (self twoMeters * 2) by: self twoMeters) to=(self twoMeters * 2).
	self assert: (self zeroMeters to: (self twoMeters * 2) by: self twoMeters) by=self twoMeters.

	self assert: (self zeroSeconds to: (self twoSeconds * 2) by: self twoSeconds) from=self zeroSeconds.
	self assert: (self zeroSeconds to: (self twoSeconds * 2) by: self twoSeconds) to=(self twoSeconds * 2).
	self assert: (self zeroSeconds to: (self twoSeconds * 2) by: self twoSeconds) by=self twoSeconds.

	self assert: (self zeroCelsius to: (self twoCelsius * 2) by: self twoCelsius) from=self zeroCelsius.
	self assert: (self zeroCelsius to: (self twoCelsius * 2) by: self twoCelsius) to=(self twoCelsius * 2).
	self assert: (self zeroCelsius to: (self twoCelsius * 2) by: self twoCelsius) by=self twoCelsius.
! !

	self assert: (self zeroMeters to: (self twoMeters * 2) ) size =5.
	self assert: (self zeroSeconds to: (self twoSeconds * 2) ) size =5.


! !

	| value |
	
	(Array with: self oneMeter with: self oneSecond) do: [ :aMeasurement |
		value := 1.
		(aMeasurement to: (aMeasurement * 10)) do: [ :anotherMeasurement |
			self assert: anotherMeasurement amount = value.
			value := value + 1 ].
		self assert: value = 11 ]
! !

	| value |

	(Array with: self oneMeter with: self oneSecond) do: [ :aMeasurement |
		value := 1.
		(aMeasurement to: (aMeasurement * 10) by: (aMeasurement*2)) do: [ :anotherMeasurement |
			self assert: anotherMeasurement amount = value.
			value := value + 2 ].
		self assert: value = 11 ]
! !