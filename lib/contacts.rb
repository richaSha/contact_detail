class Contacts
  attr_reader :id
  attr_accessor :first_name, :last_name, :job_title, :company, :contact
  @@items = []
  def initialize(attributes)
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @job_title = attributes.fetch(:job_title)
    @company = attributes.fetch(:company)
    @contact = attributes.fetch(:contact)
    @id = @@items.length
  end

  def save
    @@items.push(self)
  end

  def self.all
    @@items
  end

  def self.is_name_exist?(first_name, last_name)
    it_exists = false
    @@items.each do |items|
      if (items.first_name == first_name) && (items.last_name == last_name)
        it_exists = true
      end
    end
    it_exists
  end

  def self.update(attributes)
    id = (attributes.key?(:id) ? attributes.fetch(:id) : nil)

    @@items[id].first_name = (attributes.key?(:first_name) ? attributes.fetch(:first_name) : @@items[id].first_name)

    @@items[id].last_name = (attributes.key?(:last_name) ? attributes.fetch(:last_name) : @@items[id].last_name)

    @@items[id].job_title = (attributes.key?(:job_title) ? attributes.fetch(:job_title) : @@items[id].job_title)

    @@items[id].company = (attributes.key?(:company) ? attributes.fetch(:company) : @@items[id].company)

  end
end
