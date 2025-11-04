import 'package:flutter/material.dart';
import 'package:front_flutter/provider/form_pvd.dart';
import 'package:provider/provider.dart';
import 'package:front_flutter/core/data/data_model.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  // Form fields
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _company = TextEditingController();
  final _designation = TextEditingController();
  final _queryType = TextEditingController();
  final _message = TextEditingController();

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _email.dispose();
    _phoneNumber.dispose();
    _company.dispose();
    _designation.dispose();
    _queryType.dispose();
    _message.dispose();
    super.dispose();
  }

  Future<void> _submitForm(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;

    final provider = context.read<FormProvider>();

    final formData = FormDataModel(
      firstName: _firstName.text.trim(),
      lastName: _lastName.text.trim(),
      email: _email.text.trim(),
      phoneCountry: "India (+91)",
      phoneNumber: _phoneNumber.text.trim(),
      designation: _designation.text.trim(),
      companyName: _company.text.trim(),
      queryType: _queryType.text.trim(),
      message: _message.text.trim(),
    );

    await provider.submitForm(context, formData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Contact / Payment Form"),
        centerTitle: true,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool isWide = constraints.maxWidth > 800;
          final double formWidth = isWide ? 600 : constraints.maxWidth * 0.9;

          return Center(
            child: Consumer<FormProvider>(
              builder: (context, provider, _) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: provider.isLoading
                      ? const CircularProgressIndicator()
                      : SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(vertical: 32),
                          child: Container(
                            width: formWidth,
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    "Get in Touch",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    "Fill out the form below to connect with us.",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(color: Colors.grey[600]),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 32),
                                  _buildTextField("First Name", _firstName),
                                  _buildTextField("Last Name", _lastName),
                                  _buildTextField("Email", _email,
                                      keyboardType: TextInputType.emailAddress),
                                  _buildTextField("Phone Number", _phoneNumber,
                                      keyboardType: TextInputType.phone),
                                  _buildTextField("Company Name", _company),
                                  _buildTextField("Designation", _designation),
                                  _buildTextField("Query Type", _queryType),
                                  _buildTextField("Message", _message,
                                      maxLines: 4),
                                  const SizedBox(height: 24),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    onPressed: provider.isLoading
                                        ? null
                                        : () => _submitForm(context),
                                    child: Text(
                                      provider.isLoading
                                          ? "Submitting..."
                                          : "Submit",
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  if (provider.successMessage != null)
                                    _buildMessageBanner(
                                      context,
                                      provider.successMessage!,
                                      Colors.green[600]!,
                                    ),
                                  if (provider.errorMessage != null)
                                    _buildMessageBanner(
                                      context,
                                      provider.errorMessage!,
                                      Colors.red[600]!,
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  // Text field builder
  Widget _buildTextField(String label, TextEditingController controller,
      {int maxLines = 1, TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        validator: (value) =>
            (value == null || value.isEmpty) ? 'Please enter $label' : null,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          fillColor: Colors.grey[50],
        ),
      ),
    );
  }

  Widget _buildMessageBanner(
      BuildContext context, String message, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: color),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: color, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
