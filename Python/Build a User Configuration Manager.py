test_settings = {'theme': 'light'}

def add_setting(test_settings, setting):
    key, value = setting
    key = key.lower()
    value = value.lower()
    if key in test_settings:
        return f"Setting '{key}' already exists! Cannot add a new setting with this name."
    else:
        test_settings.update({key: value})
        return f"Setting '{key}' added with value '{value}' successfully!"

print(add_setting(test_settings, ('volume', 'high')))

def update_setting(test_settings, setting):
    key, value = setting
    key = key.lower()
    value = value.lower()
    if key in test_settings:
        test_settings.update({key: value})
        return f"Setting '{key}' updated to '{value}' successfully!"
    else:
        return f"Setting '{key}' does not exist! Cannot update a non-existing setting."

print(update_setting(test_settings, ('volume', 'medium')))

def delete_setting(test_settings, key):
    key = key.lower()
    if key in test_settings:
        test_settings.pop(key)
        return f"Setting '{key}' deleted successfully!"
    else:
        return f"Setting not found!"

print(delete_setting(test_settings, 'theme'))

def view_settings(test_settings):
    if test_settings == {}:
        return "No settings available."
    else:
        message = "Current User Settings:\n"
        for setting in test_settings.items():
            key, value = setting
            key = key.capitalize()
            message += f"{key}: {value}\n"
        return message

print(view_settings(test_settings))