-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT cf_id,backers_count FROM campaign
WHERE outcome = 'live'
ORDER BY backers_count DESC;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT COUNT (backers.cf_id), backers.cf_id
FROM backers
GROUP BY backers.cf_id
ORDER BY count DESC;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT contacts.first_name, contacts.last_name, contacts.email, (campaign.goal - campaign.pledged) AS "Remaining_Goal"
INTO email_contacts_remaining_goal_amount
FROM campaign
LEFT JOIN contacts
ON campaign.contact_id = contacts.contact_id
WHERE campaign.outcome = 'live'
ORDER BY "Remaining_Goal" DESC;


-- Check the table
SELECT * FROM email_contacts_remaining_goal_amount


-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT b.email, b.first_name, b.last_name, c.cf_id, c.company_name, c.description, c.end_date, (c.goal-c.pledged) AS "Left of Goal"
INTO email_backers_remaining_goal_amount
FROM campaign AS c
LEFT JOIN backers AS b
ON c.cf_id = b.cf_id
WHERE c.outcome = 'live'
ORDER BY b.last_name;


-- Check the table
SELECT * FROM email_backers_remaining_goal_amount

