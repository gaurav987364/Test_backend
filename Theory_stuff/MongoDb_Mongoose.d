# Setup 

install MongoDB shell, Compass & also setup atlas tool for online;

#mongod -v
#mongosh  (in terminal)

check for databases & collections

show dbs, show collections, use DbName, DbName.createCollection('collectionName'), DbName.dropDatabase(), DbName.collectionName.drop();


CRUD in MongoDb:-

#read opr.

db.collectionName.find({})   //find all objects;
db.collectionName.findOne({})   //find find only one;
db.collectionName.find({}).limit(1)   //find one;
db.collectionName.find({}).size()   //find length of collection;

some more on read opr.

//count the number of documents in a collection
db.eCart.countDocuments()


// distinct hame simply field name dena hai vo bhi sirf string me to uska result lakar dedega.
db.eCart.distinct("productId")
[ 'PROD-001', 'PROD-002' ]

#Create opr.
db.collectionName.inertOne(data,options)
db.collectionName.inertMany(data,options)

db.collectionName.insertMany([
    {},
    {},
    {},
])  // insert many documents

db.collectionName.insertOne({}) // insert only one document.


#delete opr.

db.collectionName.deleteMany([])
db.collectionName.deleteOne({})


#Update opr.

ham kisi bhi document me kisi bhi existing chij ko update kar skte hai or nahi hai to create bhi kar skte hai, but hame $set ka use krna pdta hai uske bina error ayga;

db.eCart.updateOne({productId:"PROD-001"},{name:"Gaming Laptop Pro X01"})   (without $set so error)
MongoInvalidArgumentError: Update document requires atomic operators

july_start_learning_2025_again> db.eCart.updateOne({productId:"PROD-001"},{$set:{name:"Gaming Laptop Pro X001"}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}



Q: searching nested documents?
ans:-  for eg. consider this document structure
 shipping: {
      weight: 0.35,
      dimensions: { length: 15, width: 10, height: 8, unit: 'cm' },
      freeShipping: false,
      expeditedAvailable: true,
      restrictions: [ 'lithium_battery', 'fragile' ]
    },

query is :-  db.eCart.find({"shipping.restrictions":"fragile"})🫡

Q: Also we can update or set this restrictions array like this?
ans:-  db.eCart.updateOne({field to find jis document me update krna h}, {$set:{restrictions:"new field"}})   // so mongo db itna smjhdar hai khud se usko pata h restrictions ek array hai jisme update krna hai chijo ko;

Q" Differnce B/w Find & FindOne in MongoDB?✨
ans:- find() hame "cursor" (array of documents) return krta hai jabki findOne() simple ek document return krta hai. ab fyda ye hai ki ham cursor pr kuch bhi javascript ki tarah operaions laga skate hai like:-  db.eCart.find().map((item)=> item.name)
[ 'Gaming Laptop Pro X001', 'Organic Green Tea Collection' ]


// Column querys;
Q: suppose we have array of students now we only needs name from that array from database so how we do that?.
ans:-  hame find method me hee second paramenter pass krte hai like that

{} means all documents,
{name:1} means return only names
{_id:0} isko hame alag se mongodb me batana pdta hai ye special hai varna ye har baar return hogi he hogi,

db.students.find({}, {name:1, _id:0});




//data types in MongoDB;🗒️
 we can check like this 

july_start_learning_2025_again> db.eCart.findOne().name
Gaming Laptop Pro X001

july_start_learning_2025_again> typeof db.eCart.findOne().name
string


## db.collectionName.inertMany(data,options) Now lets about these optiosn what they are
// ham _id bhi khud ki de skte hai while inserting documents, but smanjho fir same id ka or data add kiya or uske baad bhi sahi data hai to error ane se vo sab add insert nhi hoga to hame {ordered:false} krna hota hai kyuki data inserting in mongodb synchronously hoti hai ok;




























# MongoDB & Mongoose Practice Questions

## Basic Queries (Find Operations)

1. **Find all products in the "Electronics" category**
2. **Find products with a rating greater than 4.5**
3. **Find products that have free shipping available**
4. **Find all gaming laptops (use tags array)**
5. **Find products created after March 1, 2024**
6. **Find products with current price less than $50**

## Nested Document Queries

7. **Find products with Intel processors**
8. **Find products with DDR5 RAM**
9. **Find products with NVIDIA graphics cards having more than 10GB memory**
10. **Find products with IPS display panels**
11. **Find products with Wi-Fi 6E connectivity**
12. **Find products stored in "US-WEST" warehouse**

## Array Operations

13. **Find products that have both "gaming" and "high-performance" tags**
14. **Find products with SSD storage (search in storage array)**
15. **Find products with at least one 5-star review**
16. **Find products with USB-C ports (search in ports array)**
17. **Find products with G-Sync display feature**
18. **Find products with active discounts**

## Aggregation Pipeline - Basic

19. **Calculate the total number of products in each primary category**
20. **Find the average rating of all products**
21. **Count total inventory (sum of all inStock quantities)**
22. **Calculate total revenue if all current inventory sold at current prices**
23. **Find the most expensive product in each category**
24. **Group products by brand and count them**

## Aggregation Pipeline - Advanced

25. **Calculate profit margin for each product (current price - cost) and sort by highest margin**
26. **Find products with the highest review count in each category**
27. **Calculate average inventory across all warehouses for each product**
28. **Find the top 3 most reviewed products with rating above 4.0**
29. **Calculate the total value of inventory (inStock × current price) per warehouse**
30. **Group products by price range (0-50, 51-500, 501-1000, 1000+) and count**

## Complex Aggregation Operations

31. **Calculate the weighted average rating considering review distribution (multiply each star count by star number)**
32. **Find products where available inventory is less than 20% of total stock**
33. **Calculate seasonal demand score (create a formula using the seasonalDemand object)**
34. **Find correlation between product cost and average rating**
35. **Create a report showing: brand, total products, average price, highest rated product per brand**

## MongoDB Operators & Functions

36. **Use $regex to find products with "Pro" in their name**
37. **Use $exists to find products that have seasonalDemand data**
38. **Use $size to find products with exactly 3 varieties in contents array**
39. **Use $elemMatch to find products with storage capacity greater than 1000GB**
40. **Use $addFields to calculate discount percentage from MSRP to current price**

## Date Operations

41. **Find products updated in the last 30 days**
42. **Calculate how many days since each product was created**
43. **Find products with reviews posted in July 2024**
44. **Group products by creation month and count them**
45. **Find products with active seasonal discounts that end before September 2024**

## Update Operations

46. **Increase the current price of all electronics by 5%**
47. **Add a new tag "bestseller" to products with rating > 4.5**
48. **Update inventory for productId "PROD-001" - reduce available by 5**
49. **Add a new review to a product**
50. **Set all products without free shipping to have expeditedAvailable: false**

## Indexing & Performance

51. **Create compound index on category.primary and pricing.current**
52. **Create text index on name and description fields**
53. **Create index on reviews.averageRating for sorting queries**
54. **Analyze query performance using explain() for category searches**
55. **Create sparse index on seasonalDemand field**

## Mongoose-Specific Questions

56. **Design a Mongoose schema for the product document structure**
57. **Create validation rules for required fields and data types**
58. **Implement pre-save middleware to automatically update `updatedAt`**
59. **Create virtual properties for calculating profit margin and discount percentage**
60. **Implement static methods for finding featured products**
61. **Create instance methods for checking if product is in stock**
62. **Design population strategy for nested warehouse data**
63. **Implement custom validators for price ranges and inventory levels**

## Advanced MongoDB Features

64. **Use $facet to create multiple aggregation pipelines in one query**
65. **Implement change streams to monitor product price updates**
66. **Use $graphLookup for hierarchical category relationships**
67. **Create a map-reduce operation to calculate category statistics**
68. **Implement full-text search across product names and descriptions**
69. **Use $bucket to create price range distribution**
70. **Create geospatial queries if warehouse locations had coordinates**

## Practice Scenarios

71. **Build a complete e-commerce search with filters (category, price range, rating, brand)**
72. **Create an inventory management dashboard query**
73. **Generate a sales report with profit margins and trending products**
74. **Implement a recommendation system based on similar categories and ratings**
75. **Create a low-stock alert system for products below threshold**

---

## Query Difficulty Levels:
- **Beginner (1-20)**: Basic find, simple filters, basic aggregation
- **Intermediate (21-45)**: Complex aggregation, nested queries, arrays
- **Advanced (46-60)**: Updates, indexing, performance optimization
- **Expert (61-75)**: Mongoose features, advanced MongoDB operations

## Tips for Practice:
1. Start with basic queries and gradually increase complexity
2. Practice writing both MongoDB shell syntax and Mongoose syntax
3. Focus on understanding aggregation pipeline stages
4. Experiment with different indexing strategies
5. Always consider query performance and optimization
6. Practice error handling and validation scenarios