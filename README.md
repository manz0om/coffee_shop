# README

# API's

  ## Menu
    get '/menu'
      response : status 200,
      payload
      {
        data: [
          {
            caftegory_id: ,
            category_name: ,
            items: [
              {
                item_id: ,
                item_name: ,
                item_price: ,
                item_tax: 
              },
              {
                item_id: ,
                item_name: ,
                item_price: ,
                item_tax: 
              }
              ...
            ] 
          }
        ]
      }

  ## Offers
    get '/offers'
      response: status 200,
      payload
      {
        data:[
          {
            offer_id: ,
            offer_name: ,
            offer_price: ,
            items: [
              {
                item_id: ,
                item_name: ,
                item_price: ,
                item_quantity: ,
                item_discount: 
              }
            ]
          },
          {
            offer_id: ,
            offer_name: ,
            offer_price: ,
            items: [
              {
                item_id: ,
                item_name: ,
                item_price: ,
                item_quantity: ,
                item_discount: 
              },
              {
                item_id: ,
                item_name: ,
                item_price: ,
                item_quantity: ,
                item_discount: 
              }
            ]
          },
          ...
        ]
      }

    post '/offers/create'
      request :
      payload
      {
        data: [
          {
            offer_name: ,
            first_item_id: ,
            first_item_discount: ,
            first_item_quantity: ,
            second_item_id: ,
            second_item_discount: ,
            second_item_quantity:
          },
          ...
        ]
      }
      response : status 201

    put '/offers/update'
      request :
      payload
      {
        data: {
          offer_id: ,
          attributes: [
            {
              name: ,
              value:
            },
            {
              name: ,
              value:
            }
            ...
          ]
        }
      }
      response : status 204

    delete '/offers/remove'
      request :
      payload
      {
        data: {
          order_id: 
        }
      }
      response : status 204

  ## Orders   
    post '/order/create'
      request:
      payload
      {
        total: ,
        phone_number: ,
        table_number: ,
        items: [
          {
            item_id: ,
            item_name: ,
            item_price: ,
            item_quantity: ,
            item_discount: ,
            item_tax: 
          },
          {
            item_id: ,
            item_name: ,
            item_price: ,
            item_quantity: ,
            item_discount: ,
            item_tax: 
          },
          ...
        ]
      }
      response: status 201
      payload
      {
        order_id:,
        amount: ,
        status: ,
        eta: ,
        payment_link:
      }
      
    put '/order/update_status'
      request:
      payload
      {
        order_id:
      }
      response: status 204
      payload
      {
        order_id: ,
        order_status: ,
        order_payment_status: ,
        eta: 
      }
    
    get '/order/:order_id/status'
      request:
      payload
      {
        order_id: 
      }
      response: status 200
      payload
      {
        order_id: ,
        order_status: ,
        order_payment_status: ,
        eta:
      }

    post '/order/notify'
      request:
      {
        order_id: 
      }
      response: status 204
  
  ## Cart
    post '/cart/update'
      request:
      payload
      {
        data: [
          {
            item_category_id: ,
            item_id: ,
            item_quantity:
          },
          {
            item_category_id: ,
            item_id: ,
            item_quantity:
          }
          ...
        ]
      }
      response: status 200
      payload
      {
        data:[
          {
            item_category_id:
            item_id: ,
            item_quantity: ,
            item_price: ,
            item_discount: ,
            item_tax:
            item_total_price: 
          },
          ...
        ],
        total_amount: 
      }
      
  ## Payment
    post '/payment/:order_id/update'
      request:
      payload
      {
        payment_id:
        reference_id:
        status: 
        order_id:
      }

  ## Item Categories
    get '/item_categories'
      response: status 200
      payload
      {
        data: [
          {
            id:
            name:
            created_at:
            updated_at:
          },
          {
            id:
            name:
            created_at:
            updated_at:
          },
          ...
        ]
      }

    post '/item_categories/add'
      request:
      payload
      {
        data: [
          {
            name: 
          },
          {
            name: 
          },
          ...
        ]
      }
      response: status 201

    put '/item_categories/update'
      request:
      payload
      {
        data: [
          {
            item_category_id: ,
            attributes:[
              {
                name: ,
                value:
              },
              {
                name: ,
                value:
              },
              ...
            ]
          },
          ...
        ]
      }
      response: status 204

    delete '/item_categories/remove'
      request:
      payload
      {
         data: [
          {
            item_category_id: 
          },
          ...
      }
      response: status 204

  ## Items
    get '/items'
      response: status 200
      payload
      {
        data: [
          {
            id:
            name:
            price:
            tax_rate:
            availability:
            item_category_id:
            created_at:
            updated_at:
          },
          {
            id:
            name:
            price:
            tax_rate:
            availability:
            item_category_id:
            created_at:
            updated_at:
          },
          ...
        ]
      }

    post '/items/add'
      request:
      payload
      {
        data: [
          {
            name: ,
            price: ,
            tax_rate: ,
            item_category_id: 
          },
          {
            name: ,
            price: ,
            tax_rate: ,
            item_category_id: 
          },
          ...
        ]
      }
      response: status 201

    put '/items/update'
      request:
      payload
      {
        data: [
          {
            item_id: ,
            attributes:[
              {
                name: ,
                value:
              },
              {
                name: ,
                value:
              },
              ...
            ]
          },
          ...
        ]
      }
      response: status 204

    delete '/items/remove'
      request:
      payload
      {
         data: [
          {
            item_id: 
          },
          ...
      }
      response: status 204
