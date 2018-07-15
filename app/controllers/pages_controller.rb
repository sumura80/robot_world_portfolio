class PagesController < ApplicationController
	

	def about
		
	end

	def common
		@robots_name = Faker::Name.name 
		@robots_power = Faker::Superhero.power
		@robots_product_no = Faker::Number.hexadecimal(8)
		@robots_price = Faker::Commerce.price
		 


		@rand_num = rand(1..1000)
		@rand_price = rand(1..300)
		@set_number = rand(1..4)
		@bg = rand(1..2)

		#ロボットの種類を決める条件式
		if @set_number == 1
			@set = "set1"
		elsif 
			@set_number = 2
			 @set = "set2"
		elsif 
			@set_number = 3
			 @set = "set3"
		else
			 @set = "set4"
		end


		#背景を決める条件式
			if @bg == 1
				@backgroud = "bg1"
			else
				@backgroud = "bg2"
			end



		@robots = Faker::Avatar.image(@rand_num, "300x300", "png", @set, @backgroud) 

		@robots_review = rand(1..5)
		#性格を決める配列
		robots_personality_array = ["礼儀正しくてあいさつがよくできる","根気強く、ねばり強い","記憶力がよく、計算が速い","論理的思考力に優れている","造形的・美術的才能があり、精緻な技術をもっている","目標をもって、向上心がある","視野が広い、偏見が少ない、差別しない","面倒見がいい、社交的である","清楚で動物好き","正直、まじめ、きちょうめん","きちんとしている、安心して任せられる","言葉が適切、ルールを守る、誠実","親身、寛容、包容力がある","整理がうまい、要領がいい","感受性が豊か、発想が豊か","率直、裏がない、正直","料理が上手で、掃除・洗濯もこなす",].sample
		@personality = robots_personality_array
	end
end
