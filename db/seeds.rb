# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

recipients = Recipient.create([{ name: 'Des Albert', email: 'dalbert' },
                               { name: 'Grace Coleman', email: 'gcoleman' },
                               { name: 'Christopher Wahrman', email: 'cwahrman' },
                               { name: 'Gerry McCone Jr', email: 'mccone' },
                               { name: 'Adrian Wu', email: 'adrianwu' },
                               { name: 'Liz Serrano', email: 'ejacinto' },
                               { name: 'Axel Chevallier', email: 'achevail' },
                               { name: 'Marj Bernhardt', email: 'mbernhardt' },
                               { name: 'Kevin Schlabach', email: 'kschlaba' }])
states = State.create([{ name: 'draft' }, { name: 'sent' }, { name: 'accepted' }, { name: 'rejected' },
                       { name: 'completed' }, { name: 'cancelled' }, { name: 'archived'}])
subject = Subject.create([{name: 'Find new product'}, {name: 'Test config tool'},
                          {name:'Create custom code'}, {name:'Update config guide'}])