package org.codebangladesh.ui.videos

import android.annotation.SuppressLint
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.lifecycle.ViewModelProvider
import androidx.recyclerview.widget.LinearLayoutManager
import com.bumptech.glide.Glide
import org.codebangladesh.databinding.FragmentCourseVideosBinding
import org.codebangladesh.extensions.loadAssetImage
import org.codebangladesh.ui.SharedViewModel

class CourseVideosFragment : Fragment() {

    private var _binding: FragmentCourseVideosBinding? = null
    private val binding get() = _binding!!
    private lateinit var sharedViewModel: SharedViewModel
    private lateinit var categoryName: String
    private lateinit var courseName: String

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        arguments?.let {
            categoryName = it.getString("categoryName")!!
            courseName = it.getString("courseName")!!
        }
        sharedViewModel = ViewModelProvider(requireActivity())[SharedViewModel::class.java]
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentCourseVideosBinding.inflate(inflater, container, false)
        return binding.root
    }

    @SuppressLint("SetTextI18n")
    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        sharedViewModel.getCourse(categoryName, courseName)?.let { course ->
            Glide.with(this)
                .loadAssetImage(requireContext().assets, course.imageSource)
                .into(binding.categoryIconImageView)
            binding.courseNameTextView.text = course.name
            binding.courseDescTextView.text = course.description

            // Set up RecyclerView
            val courseVideosAdapter = CourseVideosAdapter(course)
            binding.courseVideoRecyclerView.apply {
                layoutManager = LinearLayoutManager(context)
                adapter = courseVideosAdapter
            }
        }


    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}