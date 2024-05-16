fn main() {

    /*
    -General Source for learning Rust syntax, structures, and practices: https://www.tutorialspoint.com/rust/rust_quick_guide.htm
    -Rust installed from https://rustup.rs/

    Other sources used:
    - ChatGPT: used to write the script for the game & ask questions about mutability https://chat.openai.com/share/c4539e4c-9f45-41a8-807b-95dedd8b3fb0
    - https://jimmco.medium.com/classes-in-rust-c5b72c0f0a4c: discussion on structs, implementations, and traits (which I had at one point but ended up removing in favor of a single Character class)
    - https://www.geeksforgeeks.org/rust-array/: array help
    - https://doc.rust-lang.org/rust-by-example/flow_control/for.html: loop help
    - https://www.tutorialspoint.com/rust/rust_operators.htm: operators, namely the NOT operator since languages like to make this different and difficult

    */

    println!("***Welcome to this quick text adventure to test out the functionality of Rust***\n
    ***Developed by Riley Fiske***");

    let mut input: String = String::new();
    println!("Please give your character a name:");
    let _ = std::io::stdin().read_line(&mut input);
    let username = input.trim();
    println!("Hello, {}!\n", username);

    let mut player = Character {
        name: String::from(username),
        hp: 32,
        damage: 4,
        persuasion: 3,
        mental_willpower: 12};

    let goblin1 = &mut Character {
        name: String::from("Goblin Scout 1"),
        hp: 8,
        damage: 4,
        persuasion: 1,
        mental_willpower: 4};

    let goblin2 = &mut Character {
        name: String::from("Goblin Scout 2"),
        hp: 8,
        damage: 4,
        persuasion: 1,
        mental_willpower: 4};

    let mut enemy_array:[&mut Character;2] = [goblin1,goblin2];

    // also instatiate the enemies here. Probably also an array for the current party the player is against.

    println!("****************************************************************");

    println!("\nPrologue:\n
    In the mystical realm of Eldoria, where magic and adventure collide, you find yourself on a dusty path leading to the quaint village of Serenwood.\n
    As a brave adventurer seeking glory, you embark on this journey, unaware of the challenges awaiting you.\n
    The road ahead is treacherous, guarded by creatures both sinister and magical.\n
    Your choices will shape your destiny - will you face these challenges head-on with your sword drawn, engage in diplomatic discourse, or opt for the swift path of retreat?\n
    The fate of Eldoria rests in your hands.\n");
    
    println!("****************************************************************");
    
    println!("\nChapter 1: Morning Dawns in Eldoria:\n
    As the sun rises over the enchanting realm of Eldoria, {} embarks on a daring journey towards the village of Serenwood.\n
    The morning air is filled with the promise of adventure as {} treads the dusty path, the beauty of nature surrounds them.\n
    Little do they know that today will be a day of trials and choices that will test their mettle.",player.name,player.name);

    println!("\nAs the day progresses, the path becomes more winding, and the rustling of leaves takes on a sinister tone.\n
    Suddenly, a horde of mischievous goblins emerges from the shadows, their eyes gleaming with mischief.\n
    The forest echoes with their taunting laughter as they block your way.\n
    Will you draw your weapon and face their menace, or attempt to negotiate your passage through this midday ambush?");

    let mut round_counter: i32 = 1;

    while player.hp > 0 && (enemy_array[0].hp > 0 || enemy_array[1].hp > 0) && (enemy_array[0].mental_willpower > 0 || enemy_array[1].mental_willpower > 0) && (enemy_array[0].hp > 0 || enemy_array[1].mental_willpower > 0) && (enemy_array[0].mental_willpower > 0 || enemy_array[1].hp > 0) {
        println!("Encounter Details: Round {}:\n {}: HP ({})\n {}: HP ({}) WP ({})\n {}: HP({}) WP({})",round_counter,player.name,player.hp,enemy_array[0].name,enemy_array[0].hp,enemy_array[0].mental_willpower,enemy_array[1].name,enemy_array[1].hp,enemy_array[1].mental_willpower);
        player_turn(&mut player,  &mut enemy_array);
        enemy_turn(&mut enemy_array,&mut player);
        round_counter += 1;
    }
    if player.hp <= 0 {
        println!("\nGameover...womp womp");
    }
    else {
        println!("\nSuccess! You have conquered the goblin horde! Thanks for playing the first encounter from this text adventure!")
    }
}

fn player_turn(player: &mut Character, enemies: &mut [&mut Character;2]) {
    println!("What will {} do:\n
    1. Attack
    2. Talk
    3. Flee", player.name);
    let mut userinput: String = String::new();
    let mut can_progress: bool = false;
    let mut first_through: bool = true;
    let mut move_choice: i32 = 0;
    while !(can_progress) {
        if !(first_through) {
            println!("Error: Please enter in a correct format (number or name)");
        }
        let _ = std::io::stdin().read_line(&mut userinput);
        let trimmed_intput = userinput.trim();
        if trimmed_intput == "1" || trimmed_intput == "1." || trimmed_intput == "Attack" || trimmed_intput == "attack" {
            move_choice = 1;
            can_progress = true;
        }
        else if trimmed_intput == "2" || trimmed_intput == "2." || trimmed_intput == "Talk" || trimmed_intput == "talk" {
            move_choice = 2;
            can_progress = true;
        } 
        else if trimmed_intput == "3" || trimmed_intput == "3." || trimmed_intput == "Flee" || trimmed_intput == "flee" {
            move_choice = 3;
            can_progress = true;
        }
        first_through = false;
    }

    userinput = String::from("");
    can_progress = false; //prep loop bools for next pass
    first_through = true;
    
    let enemy_names_string: String = String::from("1. ") + &enemies[0].name + &String::from("\n2. ") + &enemies[1].name;
    let mut target_choice: i32 = 0;

    if move_choice == 1 || move_choice == 2 { //attack
        println!("Please pick a target:\n {}",enemy_names_string);
        while !(can_progress) {
            if !(first_through) {
                println!("Error: Please enter in a correct format (number)");
            }
            
            let _ = std::io::stdin().read_line(&mut userinput);
            let trimmed_input = userinput.trim();
            println!("{}",trimmed_input);
            if trimmed_input == "1" || trimmed_input == "1." {
                target_choice = 1;
                can_progress = true;
            }
            else if trimmed_input == "2" || trimmed_input == "2." {
                target_choice = 2;
                can_progress = true;
            }
            first_through = false;
        }
        if move_choice == 1 {
            println!("{} is attacking {}!",player.name,&enemies[(target_choice-1) as usize].name);
            player.attack(enemies[(target_choice - 1) as usize])
        }
        if move_choice == 2 {
            println!("{} talks to {} persuasively.",player.name,&enemies[(target_choice-1) as usize].name);
            player.persuade(enemies[(target_choice - 1) as usize]);
        }
    }
    else if move_choice == 3 {
        println!("Running cannot save you in this world! You have forfeited your turn!");
    }

}

fn enemy_turn(enemies: &mut [&mut Character;2],player: &mut Character) {
    for enemy in enemies {
        if &enemy.hp > &0 && enemy.mental_willpower > 0  {
            enemy.attack(player);
        }
    }
}

struct Character {
    name: String,
    hp: i32,
    damage: i32,
    persuasion: i32,
    mental_willpower: i32
}

impl Character {
    fn attack(&self, opponent: &mut Character) {
        let old_hp = opponent.hp;
        opponent.take_damage(self.damage);
        println!("{} attacked {} for {} damage. {}'s HP went from {} to {}!", self.name, opponent.name, self.damage, opponent.name, old_hp, opponent.hp)
    }

    fn take_damage(&mut self, opponent_damage: i32) {
        self.hp = self.hp - opponent_damage;
    }

    fn persuade(&self, opponent: &mut Character) {
        let old_wp: i32 = opponent.mental_willpower;
        opponent.lose_mental_willpower(self.persuasion);
        println!("{} used their persuasive speech against {}, dropping their mental willpower to fight from {} to {}",self.name, opponent.name, old_wp, opponent.mental_willpower);
    }

    fn lose_mental_willpower(&mut self, opponent_persuasion: i32) {
        self.mental_willpower = self.mental_willpower - opponent_persuasion;
    }
}
