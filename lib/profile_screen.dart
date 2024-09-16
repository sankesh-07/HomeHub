import 'package:flutter/material.dart';

import 'change_password_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Controllers to hold user data
  String fullName = 'Sankesh Patil';
  String phoneNumber = '+91 84010 45505';
  String email = 'sankesh4002@gmail.com';
  String username = '@sankesh_07';

  // Function to update the profile details
  void _updateProfile(String updatedName, String updatedPhone) {
    setState(() {
      fullName = updatedName;
      phoneNumber = updatedPhone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Header Section (Profile Photo, Name, and Username)
              Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Color(0xFF648C8C),
                    child: Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fullName, // Replace with dynamic user name
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        username, // Replace with dynamic username
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 24),

              // Account Information Section
              Text(
                'Account Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Card(
                elevation: 2,
                child: ListTile(
                  title: Text('Full Name'),
                  subtitle: Text(fullName), // Replace with dynamic user name
                ),
              ),
              Card(
                elevation: 2,
                child: ListTile(
                  title: Text('Email Address'),
                  subtitle: Text(email), // Replace with dynamic user email
                ),
              ),
              Card(
                elevation: 2,
                child: ListTile(
                  title: Text('Phone Number'),
                  subtitle: Text(phoneNumber), // Replace with dynamic user phone number
                ),
              ),
              SizedBox(height: 24),

              // Account Settings Section
              Text(
                'Account Settings',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Card(
                elevation: 2,
                child: ListTile(
                  title: Text('Update Account'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return UpdateAccountDialog(
                          name: fullName,
                          phone: phoneNumber,
                          onUpdate: _updateProfile,
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 24),

              // Security Section
              Text(
                'Security',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Card(
                elevation: 2,
                child: ListTile(
                  title: Text('Change Password'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChangePasswordScreen()),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle log out button click
                    Navigator.of(context).pushReplacementNamed('/login'); // Replace with actual login route
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF648C8C),
                    foregroundColor: Colors.white, // Change text color
                  ),
                  child: Text('Log Out'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UpdateAccountDialog extends StatefulWidget {
  final String name;
  final String phone;
  final Function(String, String) onUpdate;

  UpdateAccountDialog({
    required this.name,
    required this.phone,
    required this.onUpdate,
  });

  @override
  _UpdateAccountDialogState createState() => _UpdateAccountDialogState();
}

class _UpdateAccountDialogState extends State<UpdateAccountDialog> {
  late TextEditingController nameController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    phoneController = TextEditingController(text: widget.phone);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Update Account'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Profile Photo (User can click to update)
            GestureDetector(
              onTap: () {
                // Handle profile picture change (upload or capture)
              },
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey,
                child: Icon(Icons.camera_alt, size: 30, color: Colors.white),
              ),
            ),
            SizedBox(height: 16),

            // Full Name Input
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            SizedBox(height: 16),

            // Phone Number Input
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            SizedBox(height: 16),

            // Non-editable Email
            TextField(
              enabled: false,
              decoration: InputDecoration(
                labelText: 'Email Address',
                hintText: 'sankesh4002@gmail.com', // Replace with dynamic email
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onUpdate(nameController.text, phoneController.text); // Pass updated data back
            Navigator.of(context).pop();
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}
