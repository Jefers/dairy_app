class CustomerAbility
  include CanCan::Ability

  # def initialize(customer)
  #   customer ||= Customer.new # guest customer (not logged in)
  #
  #  # can :manage, :all if customer.role == "admin"
    # can :read, :Order, :customer_id => customer.id if customer.role == "customer"
    #
    def initialize(customer)
      # Guest User
      unless customer
        can :read, [Product,Category,Announcement]
      else
         cannot :manage, CustomerHoliday
         can :create, CustomerHoliday
         # can :update, CustomerHoliday
         cannot :manage, Product
         cannot :manage, Customer
         cannot :manage, Supplier
         cannot :manage, Order
         cannot :manage, Category
         cannot :manage, Announcement
         can :my_orders, @orders

        # Admins
        if customer.admin?
          can :manage, :all
        end
      end
    end

    # if customer.admin?
    #   can :manage, :all
    # else
    #   # can :read, Order
    #   # if customer.urn?(:urn)
    #   #   can :create, Order
    #   #   can :update, Order do |order|
    #   #     order.try(:customer) == customer
    #   #   end
    #   # end
    # end
    # Define abilities for the passed in customer here. For example:
    #
    #   customer ||= User.new # guest customer (not logged in)
    #   if customer.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the customer permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the customer can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the customer can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  # end
end
