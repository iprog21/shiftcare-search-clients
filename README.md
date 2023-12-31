

## **ShiftCare Technical Challenge Description**

> You are tasked with building a minimalist command-line application
> using Ruby. Given a JSON dataset with clients (attached), the
> application will need to offer two commands:
>
> 1. Search through all clients and return those with names partially
> matching a given search query
>
> 2. Find out if there are any clients with the same email in the dataset,
> and show those duplicates if any are found.

    Requirements:
    1. ruby (ruby 3.0.2p107)
    2. json (standard library)

    Installation:
    1. download and extract the source code
    2. navigate the folder via terminal

## Problem 1:

**Search through all clients and return those with names partially matching a given search query.**
**Solution**: `ruby search_clients.rb full_name 'John Doe'`

**Output**:

    Matching clients:
    {"id"=>1, "full_name"=>"John Doe", "email"=>"john.doe@gmail.com"}

## Problem 2:

**Find out if there are any clients with the same email in the dataset, and show those duplicates if any are found.**
**Solution**: `ruby search_duplicate_emails.rb`

**Output**:

    Duplicate emails:
    jane.smith@yahoo.com: 2


**FOR API GET METHOD**
go to app directory via terminal
run server: `ruby -S rackup config.ru -p 4567`

Usage:
*Search Clients:* `curl "http://localhost:4567/api/search?key=full_name&value=John%20Doe"`

*Search Duplicate Emails:* `curl http://localhost:4567/api/find_duplicates`

**Unit Test (Minitest):**
*Search Clients:* `ruby test/search_client_test.rb`
*Search Duplicate Emails:* `ruby test/search_duplicate_emails_test.rb`
