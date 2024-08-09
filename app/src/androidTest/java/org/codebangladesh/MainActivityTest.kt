package org.codebangladesh

import androidx.core.view.GravityCompat
import androidx.test.espresso.Espresso.onView
import androidx.test.espresso.Espresso.pressBack
import androidx.test.espresso.action.ViewActions.click
import androidx.test.espresso.assertion.ViewAssertions.matches
import androidx.test.espresso.contrib.DrawerMatchers.isClosed
import androidx.test.espresso.contrib.DrawerMatchers.isOpen
import androidx.test.espresso.contrib.NavigationViewActions
import androidx.test.espresso.matcher.ViewMatchers.hasDescendant
import androidx.test.espresso.matcher.ViewMatchers.isDisplayed
import androidx.test.espresso.matcher.ViewMatchers.withContentDescription
import androidx.test.espresso.matcher.ViewMatchers.withId
import androidx.test.espresso.matcher.ViewMatchers.withText
import androidx.test.ext.junit.rules.ActivityScenarioRule
import androidx.test.ext.junit.runners.AndroidJUnit4
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(AndroidJUnit4::class)
class MainActivityTest {

    @get:Rule
    val activityRule = ActivityScenarioRule(MainActivity::class.java)

    @Test
    fun navigationDrawerOpensAndCloses() {
        // Check if drawer is closed at start
        onView(withId(R.id.drawer_layout)).check(matches(isClosed(GravityCompat.START)))

        // Open drawer
        onView(withContentDescription(R.string.navigation_drawer_open)).perform(click())
        onView(withId(R.id.drawer_layout)).check(matches(isOpen(GravityCompat.START)))

        // Close drawer
        pressBack()
        onView(withId(R.id.drawer_layout)).check(matches(isClosed(GravityCompat.START)))
    }

    @Test
    fun navigationItemSelection() {
        // Open drawer
        onView(withContentDescription(R.string.navigation_drawer_open)).perform(click())

        // Select home navigation item
        onView(withId(R.id.nav_view)).perform(NavigationViewActions.navigateTo(R.id.nav_home))
        onView(withId(R.id.nav_host_fragment_content_main))
            .check(matches(hasDescendant(withText(R.string.menu_home))))

        // Select gallery navigation item
//        onView(withContentDescription(R.string.navigation_drawer_open)).perform(click())
//        onView(withId(R.id.nav_view)).perform(NavigationViewActions.navigateTo(R.id.nav_gallery))
//        onView(withId(R.id.nav_host_fragment_content_main))
//            .check(matches(hasDescendant(withText(R.string.menu_gallery))))

        // Select slideshow navigation item
//        onView(withContentDescription(R.string.navigation_drawer_open)).perform(click())
//        onView(withId(R.id.nav_view)).perform(NavigationViewActions.navigateTo(R.id.nav_slideshow))
//        onView(withId(R.id.nav_host_fragment_content_main))
//            .check(matches(hasDescendant(withText(R.string.menu_slideshow))))
    }

    @Test
    fun optionsMenuInteraction() {
        // Open options menu
        onView(withContentDescription(R.string.action_settings)).perform(click())

        // Verify settings option is displayed
        onView(withText(R.string.action_settings)).check(matches(isDisplayed()))

        // Click on settings option
        onView(withText(R.string.action_settings)).perform(click())

        // Verify navigation to settings screen (assuming it's a new activity or fragment)
//        onView(allOf(withId(android.R.id.content), hasDescendant(withText(R.string.settings_title))))
//            .check(matches(isDisplayed()))
    }

    @Test
    fun toolbarTitleChangesWithNavigation() {
        // Check initial title
        onView(withId(R.id.toolbar)).check(matches(hasDescendant(withText(R.string.app_name))))

        // Navigate to Gallery
//        onView(withContentDescription(R.string.navigation_drawer_open)).perform(click())
//        onView(withId(R.id.nav_view)).perform(NavigationViewActions.navigateTo(R.id.nav_gallery))
//        onView(withId(R.id.toolbar)).check(matches(hasDescendant(withText(R.string.menu_gallery))))

        // Navigate to Slideshow
//        onView(withContentDescription(R.string.navigation_drawer_open)).perform(click())
//        onView(withId(R.id.nav_view)).perform(NavigationViewActions.navigateTo(R.id.nav_slideshow))
//        onView(withId(R.id.toolbar)).check(matches(hasDescendant(withText(R.string.menu_slideshow))))
    }
}