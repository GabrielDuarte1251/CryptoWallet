namespace :dev do
  desc "TODO"
  task setup: :environment do
    if Rails.env.development?
      spinner = TTY::Spinner.new("[:spinner] Executando tarefas! ...", format: :pulse_2)
      spinner.auto_spin
      %x(rails db:drop:_unsafe db:create db:migrate db:seed)
      spinner.stop("Feito!")
      %x(rails add_mining_types)
      %x(rails add_coins)
    else
      puts "Você não está em modo desenvolvimento"
    end
  end

end

  desc "Cadastra as Moedas"
  task add_coins: :environment do
  spinner = TTY::Spinner.new("[:spinner] Cadastrando moedas! ra...", format: :pulse_2)
  spinner.auto_spin
  
  coins = [
    {description: "Bitcoin",
    acronym: "BTC",
    mining_type: MiningType.find_by(acronym: "PoW")},
    

   { description: "Ethereum",
    acronym: "ETH", 
    mining_type: MiningType.all.sample},

   { description: "Dash",
    acronym: "DASH" ,
    mining_type: MiningType.all.sample}
    ]
   
   
  coins.each do |coin|
  Coin.find_or_create_by!(coin)
  end
    

  coin.find_or_create_by!(
    description: "Bitcoin",
    acronym: "BTC"
    )
    
   end

  desc "Cadastra as Tipos de Mineração"
  task add_mining_types: :environment do
  spinner = TTY::Spinner.new("[:spinner] Cadastrando tipos de mineração! ...", format: :pulse_2)
  spinner.auto_spin
  
  mining_types = [
    {description: "Proof of Work", acronym: "PoW"},
     {description: "Proof of Stake", acronym: "PoS"},
      {description: "Proof of Capacity", acronym: "PoC"}
    ]
    
     mining_types.each do |mining_type|
  MiningType.find_or_create_by!(mining_type)
  
  end
end
   
   
   
   
   
        
