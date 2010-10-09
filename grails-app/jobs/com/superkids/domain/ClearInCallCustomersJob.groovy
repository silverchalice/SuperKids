package com.superkids.domain


class ClearInCallCustomersJob {
    def cronExpression = "0 0/45 0 * * ?"

    def execute() {
        def hourOldDate = new Date(new Date().time - 3000000)
        def customers = Customer.findByInCallLessThan(hourOldDate)
        customers.each{customer ->
            customer.inCall = null
            customer.save()
        }
    }
}
