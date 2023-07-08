
<h1> Solution 1)  Determine the highest normal form of this Relation scheme.</h1>


StudentName, courseNo → grade <br>
Enrollment No, courseNo → grade <br>
StudentName → Enrollment No <br>
Enrollment No → StudentName <br>

Lets Consider StudentName as A, courseNo as B, grade as C, and Enrollment No as D
Now relations are:

* AB → C
* DB → C
* A → D
* D → A

The functional dependency does not contain any composite attribute therefore it is in **1st normal form.**

Now figuring out the candidate key which will be as follows :-
(AB)+  = ABCD, therefore AB is a candidate key,
(CB)+  = CB, therefore CB is not a candidate key,
(DB)+  = ABCD, therefore DB is a candidate key.

* Prime attributes are: A,B,D
* Non Prime attributes: C

Now for second normal form the relation must not have a partial dependency i.e. “prime → non prime” like relations.

We don’t have such dependency therefore we can say that the table is **in second normal form.**

For Third normal form the relation must not be transitive, i.e. “non-prime → non prime” in not allowed and the condition is satisfied. **Therefore, it is in Third normal form.**

For Boyce-codd Additionally, “prime → prime and non-prime → prime” is also not allowed.
Here we have two dependencies 3 

* A → D
* D → A

which violated these conditions and **it is not in Boyce-Codd normal form.**
 
<hr>
<h1>Solution 2) </h1>

_R(A,B,C,D,E)_

* CE → D 
* D → B 
* C → A 

<h2>a) Find all the candidate keys:</h2>

* (C)+ = CA 
* (CA)+ = CA
* (CB)+ = CB
* (CD)+ = CADB
* (CE)+ = CADBE

**Therefore CE is the candidate key.**

<h2>b) Find the best normal form</h2>

Since all dependencies produce a single attribute the table is in 1st Normal form.

Prime attributes are: C,E
Non prime attributes: A,B,D

Since there is a “Prime → non Prime” relation
C → A
the table is not in second normal form.

**Therefore the highest normal form is 1NF.**

<h2>c) Decompose to BCNF.</h2>

To decompose this table in BCNF, create three relations as R1(CE→D), R2(D→B) and R3(C→A). After partitioning, the resultant relations are in BCNF

<hr>
<h1>Solution 3)</h1>

R(A,B,C,D,E,F) and F(ABC→D, ABD→E, CD→F, CDF→B, BF→D)

<h2>a) Find all keys of R based on F.</h2>

* (ACB)+ = A, B, C, D, E, F
* (ACD)+ = A, C, D, F, B, E
* (ACE)+ = A, C, E
* (ACF)+ = A, C, F

Therefore there are 2 candidate keys, (ACB) and (ACD).

<h2>b) Is this Boyce-Codd Normal form? Is it 3NF?</h2>

* ABC → D
* ABD → E
* CD → F
* CDF → B
* BF → D

Prime attributes are: A, B, C, D <br>
Non-Prime attributes are: E, F.

There are no relations like “Non-prime → non-prime”, therefore there are no transitive dependency. <br>
**But There exists a partial dependency CD→F which makes it not valid for 2NF and therefore it is not in 3NF as well. Also as it is not in 3NF it is also not valid for BCNF.**

<hr>
<h1>Solution 4)</h1>
<h2>Advantages of Normalization:</h2>

* Data Integrity: Normalization ensures that each piece of data is stored only once, reducing the risk of inconsistencies and anomalies. This improves data integrity and reduces the chances of data corruption.
* Data Consistency: By eliminating data redundancy, normalization helps maintain data consistency throughout the database. Any changes or updates made to the data are reflected in a single place, reducing the risk of inconsistencies across multiple records.
* Improved Query Performance: Normalization can lead to better query performance as it allows for more efficient indexing and searching. With smaller and well-structured tables, queries can be executed faster and with fewer resources.
* Smaller Database Size: Normalization helps in reducing the database size by eliminating redundant data. This optimization can improve storage efficiency and performance.
<br>
<h2>Disadvantages of Normalization:</h2>

* Increased Complexity: As the normalization process involves decomposing a single table into multiple smaller tables, it can increase the complexity of database design. Joining tables to retrieve related information may require more complex queries.
* Potential Performance Overhead: Although normalization can improve query performance in many cases, it may introduce performance overhead in certain situations. Joining multiple tables can sometimes result in slower performance, especially for complex queries involving large datasets.
* Increased Storage Requirements: While normalization can reduce redundancy, it may increase storage requirements due to the need for additional tables and relationships. This can be a concern when storage space is limited or costly.
* Impact on Data Modification: Normalization can make updates and modifications more complex. Since data is distributed across multiple tables, modifying or deleting records may require updating multiple tables and maintaining referential integrity.
<hr>

<h1>Solution 5)</h1>
The decomposition of R into R1 and R2 is:

**R1 = (S, T, U)**

**R2 = (U, V)**

This decomposition is lossless because the intersection of R1 and R2 is the attribute U, which is a key for both R1 and R2. Additionally, all of the functional dependencies are preserved in the decomposition.

To see this, note that the only way to determine the value of T in R1 is by knowing the values of S and U. Similarly, the only way to determine the value of V in R2 is by knowing the value of U. Therefore, R1 and R2 together contain all of the information that is in R.

In addition, the decomposition is **BCNF**. This is because there are no partial ans transitive functional dependencies in the original schema, and the decomposition does not introduce any new partial or transitive functional dependencies.

**Therefore, the decomposition of R into R1 and R2 is lossless and in BCNF.**
