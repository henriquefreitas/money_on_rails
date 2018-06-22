Category.create([{ name: 'Transportation' }, { name: 'Food' }])
Category.create([{ name: 'Fuel', group: Category.first }, { name: 'Groceries', group: Category.last }])

Payee.create([{ name: 'John Doe' }, { name: 'Mary Jane' }])

tenant = Tenant.create(subdomain: 'test')

tenant.accounts << Bank.create(tenant: Tenant.first, name: 'My Bank', opening_balance: 100, balance: 100)

transaction = Account.first.transactions.create(date: Date.today, payee: Payee.first, amount: 50, memo: 'Test 1')
transaction.category_transactions.create(category: Category.find_by(name: 'Fuel'), amount: 40)
transaction.category_transactions.create(category: Category.find_by(name: 'Groceries'), amount: 10)

