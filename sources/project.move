module MyModule::GigEconomy {

    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;

    struct Gig has store, key {
        poster: address,      // Address of the gig poster
        description: vector<u8>, // Description of the gig
        reward: u64,          // Reward for completing the gig
        is_completed: bool,   // Status of gig completion
    }

    /// Function to post a new gig with a reward.
    public fun post_gig(poster: &signer, description: vector<u8>, reward: u64) {
        let gig = Gig {
            poster: signer::address_of(poster),
            description,
            reward,
            is_completed: false,
        };
        move_to(poster, gig);
    }

}
