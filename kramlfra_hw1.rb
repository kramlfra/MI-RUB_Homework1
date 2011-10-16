#
#	Realizovano pres pole obejktu, nevedel jsem jak jinak bych si pak jednotlive pole indexoval
#	Pote, co se ulozi uzly s potomci do objektu mame graf a na pruchod si urcime jen pocatek
#	a samotne prochazeni se dela objektove.
#
class Node
	@@result = []
	@sons = []
	@@helpArray = []
	attr_reader :sons, :name, :result
	attr_accessor :put, :open
	def initialize(name)		
		@name=name
		@sons=[]
		@put=false
		@open=false		
	end
	def setSon(son)
		@sons << son
	end	
#______________DFS______________	
	def dfs	
		if self.put == false	
			@@result << @name
			self.put = true
			#puts "#{self.name} , #{self.put}"
			for i in @sons				
				i.dfs
			end	
		end
	end	
#______________BFS______________	
	def bfs	# spatne neda se prece prochazet rekurzivne
	if self.put == false
			self.put = true
			for i in @sons				
				if i.put == false && i.open == false
					@@result << i.name										
					@@helpArray << i.name
					i.open = true
				end
			end				
				for i in @sons				
					i.bfs								
				end							
		end
	end	
	def bfsBetter
		pole = []		
		while @@helpArray.length != 0			
			for i in @@helpArray
				for j in i.sons
					if j.put == false
						@@result << j.name
						pole << j
						j.put = true;
					end	
				end	
			end
			@@helpArray = pole.dup
			pole = []
		end	
	end	
#______________NASTAVENI PRVNIHO UZLU U BFS______________	
	def setBfsFirst
		@@result << @name
		@@helpArray << self	
		self.put = true	
	end
#______________VYPSANI VYSLEDKU PO PROCHAZENI______________	
	def result(which)
		if which == "dfs"
			#puts "vysledek DFS"
		else
			#puts "vysledek BFS"
		end
		p @@result
		@@result = []
		@@helpArray = []
	end	
end
lineArray = []
splitLine = []
mainArray = []
#Desktop
#File.open("d:\\Skola\\Ing. studium\\3. semestr\\MI-RUB\\inputUkol1.txt","r"){|f|
#Notebook
File.open("d:\\Skola_Prace_Ostatni\\Ing. studium\\3. semestr\\MI-RUB\\inputUkol1.txt","r"){|f|
	lineArray = f.readlines
}
splitLine=lineArray[0].split(' ')
graphsCount = splitLine[0]
graphsCounter = 1
lineCounter = 1
#______________NACITANI UZLU______________
while graphsCounter <= Integer(graphsCount)
	puts "graph #{graphsCounter}"
	splitLine=lineArray[lineCounter].split(' ')
	nodesCount = splitLine[0]
	lineCounter += 1
	i=1		
	beginLineCounter = lineCounter
	totalStart = beginLineCounter
#______________VYTVARENI UZLU______________	
	while i <= Integer(nodesCount)		
		splitLine=lineArray[lineCounter].split(' ')
		i += 1	
		lineCounter += 1
		mainArray << Node.new(splitLine[0])	
	end	
	i=1
#______________VYTVARENI GRAFU______________
	while i <= Integer(nodesCount)		
		splitLine=lineArray[beginLineCounter].split(' ')					
		j=0
		while j < Integer(splitLine[1])				
			mainArray[i-1].setSon(mainArray[Integer(splitLine[j+2])-1])			
			j+=1
		end
		beginLineCounter += 1		
		i += 1
	end
	
	graphsCounter += 1
	splitLine=lineArray[lineCounter].split(' ')
#______________PROCHAZENI GRAFU______________	
	while Integer(splitLine[0]) != 0
		if Integer(splitLine[1]) == 1 #BFS
			#puts "Melo by delat BFS pro #{splitLine[0]}, #{splitLine[1]}"
			mainArray[Integer(splitLine[0])-1].setBfsFirst
			mainArray[Integer(splitLine[0])-1].bfsBetter
			mainArray[Integer(splitLine[0])-1].result("bfs")
			for k in mainArray
				k.put = false
				k.open = false				
			end
		else #DFS
			#puts "Melo by delat DFS pro #{splitLine[0]}, #{splitLine[1]}"
			mainArray[Integer(splitLine[0])-1].dfs
			mainArray[Integer(splitLine[0])-1].result("dfs")			
			for k in mainArray
				k.put = false
				k.open = false			
			end
		end
		lineCounter += 1		
		splitLine = lineArray[lineCounter].split(' ')
	end
	lineCounter += 1
	mainArray = []	
end