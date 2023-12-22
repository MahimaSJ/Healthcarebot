<?php

$conn = mysqli_connect("localhost", "root", "", "bot") or die("Database Error");

// Function to get symptoms based on user input
function getSymptomsByUserInput($userInputWords) {
    global $conn;

    $userInputList = implode("','", $userInputWords);

    $query = "SELECT sym_name FROM symptoms WHERE sym_name IN ('$userInputList')";
    $result = $conn->query($query);

    $symptoms = array();
    while ($row = $result->fetch_assoc()) {
        $symptoms[] = $row['sym_name'];
    }

    return $symptoms;
}

// Function to get disease based on symptoms
function getDiseaseBySymptoms($symptoms) {
    global $conn;

    $symptomIds = array();

    // Get symptom IDs based on symptom names
    foreach ($symptoms as $symptom) {
        $sanitizedSymptom = mysqli_real_escape_string($conn, $symptom);
        $query = "SELECT sym_id FROM symptoms WHERE sym_name LIKE '%$sanitizedSymptom%'";
        $result = $conn->query($query);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $symptomIds[] = $row['sym_id'];
        }
    }

    // If no symptom IDs found, handle the case
    if (empty($symptomIds)) {
        return "Sorry, can't understand you. Please provide clearer details.";
    }

    // Sort the symptom IDs to create a consistent mapping key
    sort($symptomIds);

    // Convert the symptom IDs to a comma-separated string
    $symptomIdsString = implode(',', $symptomIds);

    // Query the mapping table to get the disease
    $query = "SELECT disease_name FROM symptom_disease_mapping WHERE symptom_ids = '$symptomIdsString'";
    $result = $conn->query($query);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        return "Sorry to hear that. I'm not a doctor, but if you're experiencing these symptoms you may have " . $row['disease_name'] . " If these symptoms persist or become severe, or if you experience other concerning symptoms, it's crucial to seek advice from a healthcare professional for a proper diagnosis and appropriate treatment. They can provide personalized recommendations based on your specific situation and medical history.";
    } else {
        return "Sorry, can't understand you. Please provide clearer details.";
    }
}


function getSpecialistDoctor($userInput) {
    global $conn;

    // Extract words from user input
    $userInputWords = explode(' ', $userInput);

    // Initialize an array to store matching diseases
    $matchingDiseases = array();

    // Iterate through words and check if they match a disease in the table
    foreach ($userInputWords as $word) {
        $sanitizedWord = mysqli_real_escape_string($conn, $word);
        $query = "SELECT mapping_id FROM symptom_disease_mapping WHERE disease_name LIKE '%$sanitizedWord%'";
        $result = $conn->query($query);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $matchingDiseases[] = $row['mapping_id'];
        }
    }

    // Check if any matching diseases were found
    if (!empty($matchingDiseases)) {
        // Query to get specialist doctors based on diseases
        $inClause = implode(',', $matchingDiseases);
        $queryDoctor = "SELECT * FROM doctor_details WHERE doctor_id  in (SELECT doctor_id FROM disease_doctor WHERE mapping_id IN ($inClause))";
        $resultDoctor = $conn->query($queryDoctor);

        if ($resultDoctor->num_rows > 0) {
            $doctors = array();
            while ($rowDoctor = $resultDoctor->fetch_assoc()) {
                $doctors[] = $rowDoctor;
            }
            return $doctors;
        } else {
            return "No specialist doctor found for the specified diseases.";
        }
    } else {
        return "No matching diseases found in the database.";
    }
}

function getPrescriptionByDisease($userInput) {
    global $conn;

    // Extract disease name from user input
    $userInputWords = explode(' ', $userInput);
    $diseaseName = end($userInputWords);

    // Sanitize disease name
    $diseaseName = mysqli_real_escape_string($conn, $diseaseName);

    // Query the prescription table to get the medicine
    $query = "SELECT medicine FROM prescription WHERE disease_name = '$diseaseName'";
    $result = $conn->query($query);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        return "I'm not a doctor, and I cannot prescribe medications. However, I can offer some general information. It's crucial to consult with a healthcare professional for a proper diagnosis and prescription. They can evaluate your specific situation, take into account any underlying health conditions, and provide you with appropriate medical advice. In the meantime, you may consider over-the-counter medications for " . strtoupper($diseaseName) . ": " . strtoupper($row['medicine']) . ". Remember to follow the recommended dosage on the medication label and consult with a healthcare professional if you have any concerns or if you're taking other medications. It's essential to seek professional medical advice to ensure that the treatment is appropriate for your individual health needs. If your fever is persistent, severe, or accompanied by other concerning symptoms, don't hesitate to contact a healthcare professional promptly.";
    } else {
        return "Sorry, can't understand you. Please provide disease details.";
    }
    
}


function getSymptomsByUserInputContainingSymptom($userInput) {
    global $conn;

    // Check if the user input contains the word "symptom"
    if (strpos($userInput, "symptom") !== false || strpos($userInput, "symptoms") !== false) {
        // Extract words from user input
        $userInputWords = explode(' ', $userInput);

        // Initialize an array to store matching symptoms
        $matchingSymptoms = array();

        // Iterate through words and check if they match a symptom in the mapping table
        foreach ($userInputWords as $word) {
            $sanitizedWord = mysqli_real_escape_string($conn, $word);
            $query = "SELECT symptom_ids FROM symptom_disease_mapping WHERE disease_name LIKE '%$sanitizedWord%'";
            $result = $conn->query($query);

            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    // Convert the comma-separated string to an array of symptom IDs
                    $symptomIds = explode(',', $row['symptom_ids']);

                    // Fetch the symptom names based on the symptom IDs from the symptoms table
                    $symptomIdsString = implode(',', $symptomIds);
                    $symptomQuery = "SELECT sym_name FROM symptoms WHERE sym_id IN ($symptomIdsString)";
                    $symptomResult = $conn->query($symptomQuery);

                    if ($symptomResult->num_rows > 0) {
                        while ($symptomRow = $symptomResult->fetch_assoc()) {
                            $matchingSymptoms[] = $symptomRow['sym_name'];
                        }
                    }
                }
            }
        }

        // Check if any matching symptoms were found
        if (!empty($matchingSymptoms)) {
            return "Symptoms: " . implode(', ', $matchingSymptoms);
        } else {
            return "No matching symptoms found in the database.";
        }
    } else {
        return "User input does not contain the word 'symptom' or 'symptoms'.";
    }
}


// Function to get specialist by specialty name
function getSpecialistBySpecialty($userInput) {
    global $conn;
    $userInputWords = explode(' ', $userInput);
    $specialtyName = end($userInputWords);
    $specialtyName = mysqli_real_escape_string($conn, $specialtyName);
        $query = "SELECT * FROM doctor_details WHERE specialty ='$specialtyName'";
        $result = $conn->query($query);
        if ($result->num_rows > 0) {
            $doctors = array();
            while ($rowDoctor = $result->fetch_assoc()) {
                $doctors[] = $rowDoctor;
            }
            return $doctors;
        } else {
            return "No specialist doctor found for the specified specialty.";
        }
    }


function sanitizeInput($input) {
    // Implement your sanitation logic here
    return $input;
}

// Function to handle chatbot responses based on user input

function handleChatbotResponse($userInput) {
    global $conn;

    // Sanitize user input
    $getMesg = mysqli_real_escape_string($conn, $userInput);

    // Check if the user input is empty
    if (empty(trim($getMesg))) {
        echo "Looks like you have not entered anything. Please enter something so that I can help you with your problems.";
        return;
    }

    // Check if the user input matches a predefined question
    $check_data = "SELECT response_message FROM responses WHERE response_id = (SELECT response_id FROM questions WHERE question LIKE '%$getMesg%')";
    $run_query = mysqli_query($conn, $check_data) or die("Error");

    if (mysqli_num_rows($run_query) > 0) {
        $fetch_data = mysqli_fetch_assoc($run_query);
        $reply = $fetch_data['response_message'];
        echo $reply;
    } 
    elseif (
        // Assuming the user is asking for a prescription
        (strpos($userInput, "prescription") !== false) || 
        (strpos($userInput, "medicine") !== false)
    ) {
        $prescription = getPrescriptionByDisease($userInput);
        echo $prescription;
    }
    elseif (
        // Check if user is asking for a specialist doctor
        (strpos($userInput, "doctor") !== false) || 
        (strpos($userInput, "consult") !== false)
    ) {
        // Call the function once and store the result
        $doctors = getSpecialistDoctor($userInput);

        // Check if the result is an array
        if (is_array($doctors)) {
            echo "Specialist doctors:"."<br>";
            foreach ($doctors as $doctor) {
                echo "Doctor Name: {$doctor['doctor_name']}"."<br>";
                echo "Specialty: {$doctor['specialty']}"."<br>";
                echo "Doctor Number: {$doctor['doctor_number']}"."<br>";
                echo "Hospital name: {$doctor['hospital_name']}"."<br>";
                echo "Hospital Number: {$doctor['hospital_number']}"."<br>";
                echo "When choosing a healthcare professional, consider factors such as location, insurance coverage, and your specific health needs. Always verify the credentials and qualifications of any healthcare professional you consider. Additionally, consult with your primary care physician before making any decisions regarding your health.";
            }
        } 
        else {
            echo $doctors;
        }
    } elseif (
        // Check if user is asking for a specialist by specialty
        (strpos($userInput, "pulmonologist") !== false) || 
        (strpos($userInput, "neurologist") !== false) || 
        (strpos($userInput, "generalpractitioner") !== false)|| 
        (strpos($userInput, "infectiousDiseaseSpecialist")!== false)|| 
        (strpos($userInput, "ophthalmologist") !== false)|| 
        (strpos($userInput, "orthopedicsurgeon") !== false)|| 
        (strpos($userInput, "pediatrician") !== false)|| 
        (strpos($userInput, "dentist") !== false)|| 
        (strpos($userInput, "endocrinologist") !== false)|| 
        (strpos($userInput, "gastroenterologist") !== false)|| 
        (strpos($userInput, "rheumatologist") !== false)|| 
        (strpos($userInput, "urologist") !== false)|| 
        (strpos($userInput, "psychiatrist") !== false)|| 
        (strpos($userInput, "oncologist") !== false)|| 
        (strpos($userInput, "dermatopathologist") !== false)|| 
        (strpos($userInput, "allergist") !== false)|| 
        (strpos($userInput, "nephrologist") !== false)|| 
        (strpos($userInput, "hematologist") !== false)|| 
        (strpos($userInput, "plasticSurgeon") !== false)
    ) {
        $specialists = getSpecialistBySpecialty($userInput);

        if (is_array($specialists)) {
            echo "Specialist doctors:"."<br>";
            foreach ($specialists as $specialist) {
                echo "Doctor Name: {$specialist['doctor_name']}"."<br>";
                echo "Specialty: {$specialist['specialty']}"."<br>";
                echo "Doctor Number: {$specialist['doctor_number']}"."<br>";
                echo "Hospital Name: {$specialist['hospital_name']}"."<br>";
                echo "Hospital Number: {$specialist['hospital_number']}"."<br>";
                
                echo"Consult the doctor for all your healthcare related doubts and get suggestion from them."."<br>";
            }
        } 
        else {
            echo $specialists;
        }
    }
    elseif (
        // Check if the user is asking for symptoms
        (strpos($userInput, "symptom") !== false)||(strpos($userInput, "symptoms") !== false)
    ) {
        $symptoms = getSymptomsByUserInputContainingSymptom($userInput);
        echo $symptoms;
    } 
    else {
        // If not, assume the user input contains symptoms
        $userInputWords = explode(' ', $userInput);
        $matchedSymptoms = getSymptomsByUserInput($userInputWords);

        // Get the disease based on matched symptoms
        $disease = getDiseaseBySymptoms($matchedSymptoms);
        echo $disease;
    }
}

// Handle user input from the chatbot
if (isset($_POST['text'])) {
    $userInput = sanitizeInput($_POST['text']);
    handleChatbotResponse($userInput);
} 
else {
    echo "Sorry, can't be able to understand you! Please enter a valid question.";
}

// Close the database connection
$conn->close();

?>
