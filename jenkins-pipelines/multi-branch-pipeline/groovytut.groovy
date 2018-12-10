class GroovyTut{
	static void main(String[] args) {
		def paulMap = [
		'name': 'Paul',
		'age': 24,
		'address': '123 Main St',
		'list'   : [1,2,3]
		];

		def custs = [
		100 : 'Paul',
		101 : 'Molly',
		102 : 'Sia'
		]

		for(cust in custs){
			println("${cust.value} : ${cust.key}")
		}

		custs.each {println(it)}


		def greeting  = "Goodbye";

		def sayG = {theName -> println("${greeting} ${theName}")}

		sayG("DerekS")
	}
}