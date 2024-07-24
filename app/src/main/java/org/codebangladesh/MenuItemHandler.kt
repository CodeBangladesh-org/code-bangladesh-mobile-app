package org.codebangladesh

import android.view.MenuItem
import androidx.navigation.findNavController

class MenuItemHandler(private val activity: MainActivity) {

    fun handleMenuItem(item: MenuItem): Boolean = when (item.itemId) {
        R.id.action_settings -> {
            navigateToSettings()
            true
        }

        else -> false
    }

    private fun navigateToSettings() {
        activity.findNavController(R.id.nav_host_fragment_content_main)
            .navigate(R.id.settingsFragment)
    }
}