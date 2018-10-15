## Components of Underworld

This section of the Underworld User Guide is a great introduction to the basic building blocks of the software suite. We cover the individual concepts in the code and provide simple notebooks to illustrate how to use them.

---

!!! hint "**Note**"

    <p/>Expand the boxes below to read more about each notebook and to view a preview.
    You can **run** these notebooks live on [http://www.mybinder.org]( {{nb_mybinder_location("notebooks/user_guide/00_Components.ipynb") }} ).

    {{ nb_mybinder_badge("notebooks/user_guide/00_Components.ipynb") }}


??? note "**Overview** - 01_GettingStarted.ipynb"
      <p/>Read this notebook first to learn about the purpose of this
      section of the User Guide and navigate to the other notebooks.
      {{embed_url("../../nb_html/user_guide/01_GettingStarted.html")}}

??? note "**Finite element Mesh**   - 02_TheMesh.ipynb"
      <p/>The mesh in Underworld is one of the basic components of any model. The mesh holds
      the unknowns of velocity, pressure, temperature and so on.
      {{embed_url("../../nb_html/user_guide/01_GettingStarted.html")}}

??? note "**Mesh based variables** - 03_MeshVariable.ipynb"

      <p/>Mesh Variables are unknowns discretised on the structured mesh but they also
      know about how they should be interpolated, differentiated, integrated.
      {{embed_url("../../nb_html/user_guide/03_MeshVariable.html")}}

??? note "**Lagrangian (material) point swarms** - 04_Swarms.ipynb"

    <p/>Lagrangian (material) points are carried through the mesh by deformation
     of the background fluid. They record their history along their path. Collectively,
     they form a 'particle swarm' and need some careful management in a parallel code
     (which Underworld understands and does correctly)
     {{embed_url("../../nb_html/user_guide/04_Swarms.html")}}

??? note "**Underworld functions** - 05_Functions.ipynb"

    <p/> In Underworld, we need a mechanism to evaluate arbitrary mathematical
     functions at various times during the solve that we cannot predict in advance.
     We provide this feature through an interface that allows `meshVariables`
     to be combined, processed and evaluated when needed.
     {{embed_url("../../nb_html/user_guide/05_Functions.html")}}

??? note "**Equation systems**  - 06_Systems.ipynb"

    <p/> We provide templates that use the mesh, swarm, boundary conditions and variables to solve
    particular systems of equations. For example, there is a solver that is pre-configured
    to solve the incompressible Stokes equation
        \begin{align*}
            \frac{\partial \tau_{ij}}{\partial x_j} - \frac{\partial p}{\partial x_i} &= f_i \\\\
            \frac{\partial u_i}{\partial x_i} &= 0
        \end{align*}
    with various hooks for complicated constitutive behaviour and non-linearity already enabled.
    (See Stokes solver notebook for details)
    {{embed_url("../../nb_html/user_guide/06_Systems.html", nb_height="200px",)}}

??? note "**Utilities** - 07_Utilities.ipynb"

    <p/> Including ways to integrate functions across the domain / on a surface, how to store variables and
    restore them for checkpointing.
    {{embed_url("../../nb_html/user_guide/07_Utilities.html")}}


??? note "**Visualisation** - 08_Visualisation.ipynb"

    <p/> The `gLucifer` module is a parallel version of the fast, particle-based `lavavu` visualisation
    toolbox that we use to render images and create object databases during large parallel runs.

    !!! danger "Interactivity in Notebooks"

        <p/> To view the interactive aspects of lavavu running in a notebook, you will need to open the live version of the documentation.

    {{embed_url("../../nb_html/user_guide/08_Visualisation.html")}}


??? note "**Stokes solver configuration** - 09_StokesSolver.ipynb"

    <p/> The Stokes solver is the engine of Underworld and may require some tuning up to perform at its
    best. This notebook delves into some of the options available.
    {{embed_url("../../nb_html/user_guide/09_StokesSolver.html")}}
