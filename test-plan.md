# Test Plan for Cat Facts API

## Project Overview
This document outlines the test plan for automating the testing of the Cat Facts API and performance testing using K6.

---

## 1. Scope
The goal is to validate the functionality, performance, and reliability of the Cat Facts API endpoints:
- `/fact`
- `/facts`
- `/breeds`
- `/breeds?page={page}`

---

## 2. Test Scenarios

### **Functional Test Scenarios**
| Test ID | Endpoint        | Method | Scenario Description                                                 | Expected Result                          |
|---------|-----------------|--------|-----------------------------------------------------------------------|------------------------------------------|
| TC-001  | `/fact`         | GET    | Validate a random fact is returned with proper format.               | Status 200; Response contains `fact`.   |
| TC-002  | `/facts`        | GET    | Fetch multiple facts with pagination (default page=1).               | Status 200; `data` array is returned.   |
| TC-003  | `/breeds`       | GET    | Fetch list of cat breeds with breed and country fields.              | Status 200; Valid breed data.           |
| TC-004  | `/breeds?page=2`| GET    | Fetch breeds from page 2 to test pagination.                         | Status 200; Current page is 2.          |
| TC-005  | `/fact`         | GET    | Test response time under 500ms.                                      | Response time < 500ms.                  |

---

### **Performance Test Scenarios**
| Test ID | Endpoint        | Load Type          | Scenario Description                       | Success Criteria                           |
|---------|-----------------|--------------------|-------------------------------------------|-------------------------------------------|
| PT-001  | `/fact`         | 10 users for 1 min | Simulate 10 users making API calls.       | Status 200; Response time < 500ms.        |
| PT-002  | `/facts`        | 5 users for 1 min  | Simulate load for fetching multiple facts.| Status 200; All requests are successful.  |

---

## 3. Tools Used
- **API Testing:** Jest + Frisby
- **Performance Testing:** K6

---

## 4. Test Environment
| Component           | Details                   |
|---------------------|---------------------------|
| Base URL            | `https://catfact.ninja`   |
| Test Framework      | Jest + Frisby             |
| Performance Tool    | K6                        |
| OS & Environment    | Linux/macOS/Windows       |

---

## 5. Test Execution
| Step | Description                                |
|------|--------------------------------------------|
| 1    | Run functional tests using Jest + Frisby.  |
| 2    | Execute performance tests using K6.        |
| 3    | Review test results and create reports.    |


## 6. Running the Tests

### Step 1: Running Functional Tests (Jest + Frisby)

1. **Navigate to the project directory** where the test files are located:
   ```bash
   cd api-tests
   npm install
   npm test
   npx jest api.test.js #for specific test file run


### Step 2: Running Performance Tests (K6)
1. Install K6 you can install K6 using the package manager for your system:

    -Windows: ```choco install k6```

    -MacOS: ```brew install k6```

    -Linux (Ubuntu/Debian): ``` sudo apt install k6```
2. Navigate to the performance-tests directory where the load-test.js script is located.
3. To run the performance tests, execute the following command:
```bash 
k6 run performance-tests/performance.test.js
