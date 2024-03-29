#pragma once
#pragma once
class database; // Forward declaration because C++ sucks. 

#include <string>
#include <vector>
#include "./Product.h"
#include "./User.h"
using std::string;

class Rental
{
    friend class database;  // Lol
public:
    Rental(database& db);
    Rental(database& db, User* user, Product* product, long int rented_at, long int is_due_at, float charge);
    // Properties
    // Getters
    int id() const;                // Getter for _id
    Product* product() const;      // Getter for product
    long int returned_at() const;  // Getter for returned_at
    long int rented_at() const;    // Getter for rented_at
    long int is_due_at() const;    // Getter for is_due_at
    float charge() const;          // Getter for charge

    // Setters
    void setId(int _id);                       // Setter for _id
    void setProduct(Product* product);         // Setter for product
    void setReturnDate(long int returned_at);  // Setter for returned_at
    void setRentedAt(long int rented_at);      // Setter for rented_at
    void setDueDate(long int is_due_at);       // Setter for is_due_at
    void setCharge(float charge);              // Setter for charge
    void setUser(User* user);                  // Setter for user

    // Utility
    void delete_(int id);  // Delete rental by ID
    void write();  // Write or overwrite object to database
private:
    int _id;               // Database ID
    Product* _product;      // Rental product
    long int _returned_at;  // Return date
    long int _rented_at;    // Date rented
    long int _is_due_at;    // Deadline for return
    float _charge;          // Amount due
    User* _user;            // User that rented the product
    // Database object
    database& db;       // Database instance object reference
};
