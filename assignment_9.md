# Question 1:

Redis is an open-source, in-memory data structure store that is widely used as a database, cache, and message broker. It offers several key features that make it popular among developers and used in various applications. Here are some of the main features of Redis:

* In-Memory Data Storage: Redis stores data primarily in memory, resulting in fast data access and low-latency operations. It leverages an in-memory data structure storage model, which allows for high-performance read and write operations.

* Data Structures: Redis provides a rich set of data structures that go beyond key-value storage. These include strings, lists, sets, sorted sets, hashes, and more. Each data structure comes with its own set of operations, enabling developers to build complex data models and perform operations directly on stored data.

* Persistence Options: Redis supports persistence, allowing data to be saved to disk and reloaded upon restart. It offers two persistence options: RDB (snapshotting) and AOF (append-only file). RDB periodically takes snapshots of the dataset, while AOF logs every write operation, providing durability and the ability to recover data in case of failures.

* Pub/Sub Messaging: Redis supports publish/subscribe messaging, allowing for real-time communication between different components or clients. Publishers send messages to channels, and subscribers receive messages from subscribed channels. This feature enables building real-time applications, message queues, and event-driven systems.

* Distributed Caching: Redis is commonly used as a cache due to its fast in-memory storage and support for advanced data structures. It provides built-in cache expiration, eviction policies, and automatic cache invalidation, making it efficient for accelerating application performance by caching frequently accessed data.

# Question 2:

Some of the limitations of redis are mentioned below:-

* Limited Storage Capacity: Redis's in-memory storage means its capacity is limited by the amount of RAM available. Large datasets that cannot fit in memory may not be suitable for Redis without sharding or external storage solutions.

* No Native Disk Durability: Although Redis supports persistence options like RDB and AOF, they are primarily used for data recovery and not for real-time durability. Redis is optimized for speed and may not be the best choice for scenarios where data persistence to disk is a critical requirement.

* Single-Threaded Nature: Redis is predominantly single-threaded, which means it can only handle one request at a time. While this can provide simplicity and avoid concurrency-related issues, it may limit the overall throughput for highly concurrent workloads.

* Lack of Complex Querying: Redis offers basic querying capabilities like key lookup, range queries, and pattern matching, but it lacks the advanced querying features found in SQL databases. Complex operations involving multiple keys or complex conditions may require client-side logic or additional data modeling.

* Lack of ACID Transactions: Redis does not provide full ACID (Atomicity, Consistency, Isolation, Durability) guarantees across multiple keys or operations. While it does support atomic operations on individual data structures, transactional consistency across multiple operations is not inherent in Redis.

# Question 3:

**Using Java for CRUD operations in Redis**

**First some dependanceies must be added using _maven_**

```maven maven
<dependency>
    <groupId>redis.clients</groupId>
    <artifactId>jedis</artifactId>
    <version>4.3.1</version>
</dependency>
```
**The using the Jedis class CRUD operations can be performed.**
```java Java

import redis.clients.jedis.Jedis;

public class RedisCRUDExample {
    public static void main(String[] args) {
        // Create a Jedis client
        Jedis jedis = new Jedis("localhost");

        // CREATE: Add a new key-value pair
        jedis.set("name", "John Doe");

        // READ: Retrieve the value associated with a key
        String name = jedis.get("name");
        System.out.println(name); // Output: John Doe

        // UPDATE: Update the value of an existing key
        jedis.set("name", "Jane Smith");

        // READ: Retrieve the updated value
        name = jedis.get("name");
        System.out.println(name); // Output: Jane Smith

        // DELETE: Remove a key-value pair
        jedis.del("name");

        // READ: Attempt to retrieve the value (should be null)
        name = jedis.get("name");
        System.out.println(name); // Output: null

        // Close the Jedis client
        jedis.close();
    }
}

```

These operations can also be performed by directly using the command line:
```linux linux
┌─[harsh@parrot]─[~/Desktop]
└──╼ $redis-cli
127.0.0.1:6379> set name "Harsh"
OK
127.0.0.1:6379> get name
"Harsh"
127.0.0.1:6379> set name "Happy"
OK
127.0.0.1:6379> get name
"Happy"
127.0.0.1:6379> del name
(integer) 1
127.0.0.1:6379> get name
(nil)

```

# Question 4:
In Redis, the TTL (Time To Live) command is used to set an expiration time for a key. It determines the amount of time that a key will exist in the database before it automatically gets deleted. This feature is useful for implementing caching, session management, and other scenarios where you want data to be automatically expired and removed after a certain period.

The TTL command allows you to check the remaining time to live for a key or set an expiration time for a key. Here's an example of how to use the TTL command in Redis:

Set a key-value pair with an expiration time of 60 seconds:

```linux linux
┌─[harsh@parrot]─[~/Desktop]
└──╼ $redis-cli
set mykey "Hello, Redis" EX 60
```

# Question 5:

```
┌─[harsh@parrot]─[~/Desktop]
└──╼ $redis-cli
127.0.0.1:6379> mset first_name "Harsh" last_name "Tripathi"
OK
127.0.0.1:6379> set age 22
OK
127.0.0.1:6379> mget first_name age
1) "Harsh"
2) "22"
127.0.0.1:6379> incr age
(integer) 23
127.0.0.1:6379> get age
"23"
127.0.0.1:6379> expire first_name 60
(integer) 1
127.0.0.1:6379> expire age 60
(integer) 1
127.0.0.1:6379> ttl age
(integer) 56
127.0.0.1:6379> ttl first_name
(integer) -2
127.0.0.1:6379> get first_name
(nil)
```
