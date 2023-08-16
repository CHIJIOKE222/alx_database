SQL technique: subqueries
Sometimes you don’t have enough information available when you design a query to determine which rows you want. In this case, you’ll have to find the required information with a subquery.

Example: Find the name of customers who live in the same zip code area as Wayne Dick. We might start writing this query as we would any of the ones that we have already done:

        SELECT cFirstName, cLastName
        FROM customers
        WHERE cZipCode = ???
Oops! We don’t know what zip code to put in the WHERE clause. No, we can’t look it up manually and type it into the query—we have to find the answer based only on the information that we have been given!
Fortunately, we also know how to find the right zip code by writing another query:
        SELECT cZipCode
        FROM Customers
        WHERE cFirstName = 'Wayne' AND cLastName = 'Dick';
Zip code
90840
Notice that this query returns a single column and a single row. We can use the result as the condition value for cZipCode in our original query. In effect, the output of the second query becomes input to the first one, which we can illustrate with their relation schemes:
Customer subquery attributes

Syntactically, all we have to do is to enclose the subquery in parenthses, in the same place where we would normally use a constant in the WHERE clause. We’ll include the zip code in the SELECT line to verify that the answer is what we want:
        SELECT cFirstName, cLastName, cZipCode
        FROM customers
        WHERE cZipCode =        
          (SELECT cZipCode
           FROM customers
           WHERE cFirstName = 'Wayne' AND cLastName = 'Dick');
Customers
Alvaro	Monge	90840
Wayne	Dick	90840
A subquery that returns only one column and one row can be used any time that we need a single value. Another example would be to find the product name and sale price of all products whose unit sale price is greater than the average of all products. We can see that the DISTINCT keyword is needed, since the SELECT attributes are not a super key of the result set:

        SELECT DISTINCT prodName, unitSalePrice
        FROM Products NATURAL JOIN OrderLines
        WHERE unitSalePrice > the average unit sale price
Again, we already know how to write another query that finds the average:
        SELECT AVG(unitSalePrice)
        FROM OrderLines;
Average
10.621428
We can visualize the combined queries with their relation schemes, and write the full syntax as before:
