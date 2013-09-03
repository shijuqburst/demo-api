# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



pms_information = PmsInformation.create({end_point_url: 'stayntouch.com' , password: 'qburst' , username: 'qburst'})
pms_type = PmsType.create({ pms_type_code: 123, pms_type_name: 'STAYNTOUCH',pms_connector_class: 'OperaConnector'})
pms_type.pms_information = pms_information
hotel_chain =HotelChain.create({chain_code:212 , chain_name: 'CHA1'} )
pms_information.hotel_chains << hotel_chain


