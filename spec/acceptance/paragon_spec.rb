require File.expand_path( File.dirname( __FILE__ ) + '/acceptance_helper' )

feature "Paragon Spec for ArtisanEngine", %q{
  I want to create my administrator account:
    01.   Visit the home page.
    02.   Create my artisan account.
  
  I want to create a good:
    03.   Create a basic good.
    04.   Create some option types.
    05.   Create some option values for my option types.
    06.   Add my new option types to my good.
    07.   Add variants to my good.
    08.   Add images to my good.
    
  I want to organize my goods:
    09.   Add a custom collection.
    10.   Add my good to the custom collection.
    
  I want to set up my site's navigation:
    11.   Add a navigation guide.
    12.   Add my custom collection to the navigation guide.
    
  I want to ensure that my good is properly displayed around the site:
    13.   Sign out to simulate a regular user.
    14.   Visit my custom collection and see my good.
    15.   Visit the individual good page for my good to see its options and images.
  
  I want to add my new good to my order:
    16.   Select a variant of my good and add it to my order.

  I want to check out:
    17.   Check out with valid information and Pay with PayPal.

  I want to manage the new order:
    18.   Sign in as an artisan.
    19.   Visit the new order's page to confirm the details and that payment was received.
    20.   Ship the order.
} do

  scenario "Paragon" do

    # 01. Visit the home page. 
    # ( Pages - Visit the home page. )
    visit '/'

    # 02. Create my artisan account. 
    # ( Auth - Sign up for an artisan account. )
    create_artisan_account :email    => 'paragonian@artisanengine.com',
                           :password => 'paragon'

    # 03. Create a basic good. 
    # ( Catalog - Create a good. )
    create_good :name => 'Rocket to the Stars'
                                  
    # 04. Create some option types. 
    # ( Catalog - Create an option type. )
    create_option_type 'Engine'
    create_option_type 'Fuel'

    # 05. Create some option values for my option types. 
    # ( Catalog - Add an option value to an option type. )
    for value in %w( Model-T Jet Hyperdrive )
      create_option_value 'Engine', value
    end
    
    for value in %w( Gasoline Vegetables Rainbows )
      create_option_value 'Fuel', value
    end

    # 06. Add my new option types to my good. 
    # ( Catalog - Add and remove option types on a good. )
    add_option_type 'Engine',  :to => 'Rocket to the Stars'
    add_option_type 'Fuel',    :to => 'Rocket to the Stars'
   
    # 07. Add variants to my good. 
    # ( Catalog - Add a variant to a good. )
    create_variant_for 'Rocket to the Stars', :values => { :engine => 'Hyperdrive',
                                                           :fuel   => 'Rainbows' }
    
    # 08. Add images to my good. 
    # ( Catalog - Attach an image to a good. )
    attach_test_image_to Good.find_by_name( 'Rocket to the Stars' )

    # 09. Add a custom collection. 
    # ( Collectability - Create a custom collection. )
    create_custom_collection 'Various Spacecraft'

    # 10. Assign my good to the custom collection. 
    # ( Collectability - Add a collect to a custom collection. )
    collect :good => 'Rocket to the Stars', :into => 'Various Spacecraft'
    
    # 11. Add a navigation guide. 
    # ( Guidability - Create a guide. )
    create_guide 'Primary Navigation'

    # 12. Add my custom collection to the navigation guide. 
    # ( Guidability - Add a link to a guide. )
    create_link_to :custom_collection => 'Various Spacecraft', :in => 'Primary Navigation'

    # 13. Sign out to simulate a regular user. 
    # ( Auth - Sign out of my artisan account. )
    visit '/artisans/sign_out'

    # 14. Visit my custom collection to see my good. 
    # ( Guidability    - View a guide + 
    #   Collectability - View a custom collection. )
    click_link 'Various Spacecraft'

    # 15. Visit the individual good page for my good to see its options and images. 
    # ( Catalog - Visit a good. )
    click_link 'Rocket to the Stars'
    
    # 16. Select a variant of my good and add it to my order.
    # ( Commerce - Add a line item to an order. )
    add_to_order 'Rocket to the Stars', :engine => 'Hyperdrive', 
                                        :fuel   => 'Rainbows'
    
    # 17. Check out with valid information and pay with PayPal.
    # ( Commerce - Check out. )
    visit '/checkout'
    fill_in_valid_checkout_information
    click_button 'Pay with PayPal'
    simulate_ipn
    
    # 18. Sign in as an artisan.
    # ( Auth - Sign In to an Artisan Account )
    sign_in_as_artisan 'paragonian@artisanengine.com', 'paragon'
    
    # 19. Visit the new order's page to confirm the details and that payment was received.
    # ( Commerce - View Order Details )
    visit "/manage/orders/#{ Order.last.id }"
    
    # 20. Ship the order.
    # ( Commerce - Fulfill an Order )
    fulfill_order :line_items => %w( Rocket to the Stars )
  end
end